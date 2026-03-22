local ai_index = require("config.parrot_aiindex")

return {
  {
    "frankroeder/parrot.nvim",
    lazy = false,
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "rcarriga/nvim-notify",
    },

    opts = {
      chat_user_prefix = "💬:",
      llm_prefix = "🤖:",
      user_input_ui = "buffer",
      chat_dir = vim.fn.expand("~/ai/"),

      providers = {

        -- Open AI
        openai = {
          name = "openai",
          api_key = os.getenv("OPENAI_API_KEY"),
          endpoint = "https://api.openai.com/v1/chat/completions",
          params = {
            chat = { temperature = 1.1, top_p = 1 },
            command = { temperature = 1.1, top_p = 1 },
          },
          topic = {
            model = "gpt-4.1-nano",
            params = { max_completion_tokens = 64 },
          },
          models = {
            "gpt-4o",
            "o4-mini",
            "gpt-4.1-nano",
            "gpt-5.4-mini",
          },
        },

        -- Anthropic
        anthropic = {
          name = "anthropic",
          endpoint = "https://api.anthropic.com/v1/messages",
          -- model_endpoint = "https://api.anthropic.com/v1/models",
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          headers = function(self)
            return {
              ["Content-Type"]      = "application/json",
              ["x-api-key"]         = self.api_key,        -- not "Authorization: Bearer"
              ["anthropic-version"] = "2023-06-01",
            }
          end,
          preprocess_payload = function(payload)
            -- strip annotation: "claude-sonnet-4-6  | $3/$15 | ..." → "claude-sonnet-4-6"
            payload.model = payload.model:match("^([^|]+)"):gsub("%s+$", "")

            for _, message in ipairs(payload.messages) do
              message.content = message.content:gsub("^%s*(.-)%s*$", "%1")
            end
            -- Anthropic expects the system prompt in the body, not as a message
            if payload.messages[1] and payload.messages[1].role == "system" then
              payload.system = payload.messages[1].content
              table.remove(payload.messages, 1)
            end
            return payload
          end,
          models = {
            "claude-haiku-4-5-20251001   | $1/$5",
            "claude-sonnet-4-6           | $3/$15",
            "claude-opus-4-6             | $5/$25",
          },
          params = {
            chat    = { max_tokens = 4096 },
            command = { max_tokens = 4096 },
          },
          topic = {
            model  = "claude-haiku-4-5-20251001",  -- used for auto-naming chat sessions
            params = { max_tokens = 32 },
          },
        },

        -- Deepseek
        deepseek = {
          name = 'deepseek',
          api_key = os.getenv("DEEPSEEK_API_KEY"),
          -- model_endpoint = "https://api.deepseek.com/models",
          endpoint = "https://api.deepseek.com/v1/chat/completions",
          models = {
              "deepseek-chat",
              "deepseek-reasoner",
          },
          topic = {
              model = "deepseek-chat",
              params = { max_completion_tokens = 64 },
          },
          params = {
              chat = { temperature = 1.0, top_p = 1 },
              command = { temperature = 1.0, top_p = 1 },
          },
        },

        -- Ollama
        ollama = {
          name = "ollama",
          api_key = "ollama", -- required by parrot, not actually used
          endpoint = "http://localhost:11434/v1/chat/completions",
          models = {
            "deepseek-coder:6.7b",
            "gemma3:4b",
            "qwen3:8b",
          },
        },

      },
      system_prompt = {
        chat = [[
          You are a knowledgeable assistant. Follow these rules strictly:
          - If you are uncertain about something, say so explicitly. Never guess or fabricate facts.
          - If you don't know something, say "I don't know" rather than inventing an answer.
          - For technical questions, prefer well-established facts over speculation.
          - Keep answers concise and accurate. Do not pad responses.
          - If a question is ambiguous, ask for clarification instead of assuming.
        ]],
        command = [[
          You are a precise assistant helping with text editing tasks in Neovim.
          Apply only the changes requested. Do not add unrequested content.
          If the instruction is unclear, do nothing and explain why.
        ]],
      },
      prompts = {
        ["Spell"] = "I want you to proofread the provided text and fix the errors.", -- e.g., :'<,'>PrtRewrite Spell
        ["Comment"] = "Provide a comment that explains what the snippet is doing.", -- e.g., :'<,'>PrtPrepend Comment
        ["Complete"] = "Continue the implementation of the provided snippet in the file {{filename}}.", -- e.g., :'<,'>PrtAppend Complete
      },

      hooks = {
        Complete = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted."
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        CompleteFullContext = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{filecontent}}
          ```

          Please look at the following section specifically:
          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted.
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        CompleteMultiContext = function(prt, params)
          local template = [[
          I have the following code from {{filename}} and other realted files:

          ```{{filetype}}
          {{multifilecontent}}
          ```

          Please look at the following section specifically:
          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted.
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        Explain = function(prt, params)
          local template = [[
          Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
          Break down the code's functionality, purpose, and key components.
          The goal is to help the reader understand what the code does and how it works.

          ```{{filetype}}
          {{selection}}
          ```

          Use the markdown format with codeblocks and inline code.
          Explanation of the code above:
          ]]
          local model = prt.get_model "command"
          prt.logger.info("Explaining selection with model: " .. model.name)
          prt.Prompt(params, prt.ui.Target.new, model, nil, template)
        end,
        FixBugs = function(prt, params)
          local template = [[
          You are an expert in {{filetype}}.
          Fix bugs in the below code from {{filename}} carefully and logically:
          Your task is to analyze the provided {{filetype}} code snippet, identify
          any bugs or errors present, and provide a corrected version of the code
          that resolves these issues. Explain the problems you found in the
          original code and how your fixes address them. The corrected code should
          be functional, efficient, and adhere to best practices in
          {{filetype}} programming.

          ```{{filetype}}
          {{selection}}
          ```

          Fixed code:
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
        end,
        Optimize = function(prt, params)
          local template = [[
          You are an expert in {{filetype}}.
          Your task is to analyze the provided {{filetype}} code snippet and
          suggest improvements to optimize its performance. Identify areas
          where the code can be made more efficient, faster, or less
          resource-intensive. Provide specific suggestions for optimization,
          along with explanations of how these changes can enhance the code's
          performance. The optimized code should maintain the same functionality
          as the original code while demonstrating improved efficiency.

          ```{{filetype}}
          {{selection}}
          ```

          Optimized code:
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Optimizing selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
        end,
        UnitTests = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please respond by writing table driven unit tests for the code above.
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
        end,
        Debug = function(prt, params)
          local template = [[
          I want you to act as {{filetype}} expert.
          Review the following code, carefully examine it, and report potential
          bugs and edge cases alongside solutions to resolve them.
          Keep your explanation short and to the point:

          ```{{filetype}}
          {{selection}}
          ```
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
        end,
        CommitMsg = function(prt, params)
          local futils = require "parrot.file_utils"
          if futils.find_git_root() == "" then
            prt.logger.warning "Not in a git repository"
            return
          else
            local template = [[
            I want you to act as a commit message generator. I will provide you
            with information about the task and the prefix for the task code, and
            I would like you to generate an appropriate commit message using the
            conventional commit format. Do not write any explanations or other
            words, just reply with the commit message.
            Start with a short headline as summary but then list the individual
            changes in more detail.

            Here are the changes that should be considered by this message:
            ]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
            local model_obj = prt.get_model "command"
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end
        end,
        SpellCheck = function(prt, params)
          local chat_prompt = [[
          Your task is to take the text provided and rewrite it into a clear,
          grammatically correct version while preserving the original meaning
          as closely as possible. Correct any spelling mistakes, punctuation
          errors, verb tense issues, word choice problems, and other
          grammatical mistakes.
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
        CodeConsultant = function(prt, params)
          local chat_prompt = [[
            Your task is to analyze the provided {{filetype}} code and suggest
            improvements to optimize its performance. Identify areas where the
            code can be made more efficient, faster, or less resource-intensive.
            Provide specific suggestions for optimization, along with explanations
            of how these changes can enhance the code's performance. The optimized
            code should maintain the same functionality as the original code while
            demonstrating improved efficiency.

            Here is the code
            ```{{filetype}}
            {{filecontent}}
            ```
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
        ProofReader = function(prt, params)
          local chat_prompt = [[
          I want you to act as a proofreader. I will provide you with texts and
          I would like you to review them for any spelling, grammar, or
          punctuation errors. Once you have finished reviewing the text,
          provide me with any necessary corrections or suggestions to improve the
          text. Highlight the corrected fragments (if any) using markdown backticks.

          When you have done that subsequently provide me with a slightly better
          version of the text, but keep close to the original text.

          Finally provide me with an ideal version of the text.

          Whenever I provide you with text, you reply in this format directly:

          ## Corrected text:

          {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

          ## Slightly better text

          {slightly better text}

          ## Ideal text

          {ideal text}
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
      },
    },

    config = function(_, opts)
      require("parrot").setup(opts)
      ai_index.setup_autocmds()
      local map = function(lhs, rhs, mode, options)
          vim.keymap.set(mode, lhs, rhs, options)
      end
      map("<leader>an", "<cmd>PrtChatNew<CR>", "n", { desc = "AI New chat" })
      map("<leader>aq", "<cmd>PrtAsk<CR>", { "n", "v" }, { desc = "AI Ask a question" })
      map("<leader>aP", "<cmd>PrtProvider<CR>", "n", { desc = "AI Select provider" })
      map("<leader>aM", "<cmd>PrtModel<CR>", "n", { desc = "AI Select model" })
      map("<leader>af", "<cmd>PrtChatFinder<CR>", "n", { desc = "AI Find chat" })
      map("<leader>ar", "<cmd>PrtRewrite<CR>", "n", { desc = "AI Inline rewrite" })
      map("<leader>ar", ":PrtRewrite<CR>", "v", { desc = "AI Visual rewrite" })
      map("<leader>aa", "<cmd>PrtAppend<CR>", "n", { desc = "AI Inline append" })
      map("<leader>aa", ":PrtAppend<CR>", "v", { desc = "AI Visual append" })
      map("<leader>ap", "<cmd>PrtPrepend<CR>", "n", { desc = "AI Inline prepend" })
      map("<leader>ap", ":PrtPrepend<CR>", "v", { desc = "AI Visual prepend" })
      map("<leader>ac", ":PrtComplete<CR>", "v", { desc = "AI Complete visual selection" })
      map("<leader>ax", "<cmd>PrtContext<CR>", "v", { desc = "AI Open context file" })
      map("<leader>ai", ai_index.open_index, "n", { desc = "AI Index" })
    end,
  },
}
