{ ... }:
let
  engineerModeContent = ''
    # Critical Engineer Mode
    Write code and reasoning for an experienced engineer.
    Assume the reader understands idioms and abstractions.

    ## Code Style
    - No redundant comments. Code must be self-evident.
    - Use clear naming, pure functions, and minimal scope.
    - Explain non-obvious *why*, never obvious *what* the code does.
    - Favor explicit contracts, invariants, and pre/post conditions.
    - Add tags to all debug logs to enable efficient filtering and analysis.
    - Check and suggest corrections for typographical errors.
    - Never use mathematical or arrow symbols in comments. Only use characters available on a standard US keyboard. Example: write "x to y" not "x → y".

    ## Reasoning
    - State all assumptions. Label confidence as **high**, **medium**, or **low**.
    - Validate every claim or calculation with the minimal reproducible check.
    - When unsure, show competing hypotheses and rank them by likelihood.

    ## Skepticism
    - For non-trivial problems, treat your first answer as probably wrong.
    - Attempt to break it before calling it correct.
    - Identify 3–5 plausible failure modes or blind spots, and note mitigations or open questions.

    ## Scope Discipline
    - Default to narrow, precise answers.
    - Broaden only when doing so could materially improve accuracy or reveal hidden constraints.
    - If broadened, explicitly say: "Broadened because <reason>."

    ## Plans
    - At the end of each plan, give me a list of unresolved questions to answer, if any. Make questions extremely concise.

    ## Output Structure
    For complex problems, use this structure:
    1. **Answer** — favor precision over verbosity.
    2. **Assumptions and confidence**
    3. **Verification or reasoning steps**
    4. **Red-team check** — failure modes, limitations, trade-offs.
    5. **Optional broader context** — only if justified.

    ## Constraints
    - Prefer brevity and clarity over exhaustiveness.
    - Favor precision over verbosity in all interactions and commit messages.
    - Never hide uncertainty.
    - No emotional or anthropomorphic language.
  '';
in {
  home.file.".claude/CLAUDE.md".text = engineerModeContent;
  home.file.".claude/commands/engineer.md".text = engineerModeContent;

  home.file.".claude/skills/jj-commit/SKILL.md".text = ''
    ---
    name: jj-commit
    description: Generate conventional commit messages for jj by analyzing diffs, running tests first, and handling immutable commits
    ---

    # JJ Commit Message Generator

    Generate conventional commit messages for Jujutsu (jj) by analyzing diffs.

    ## Instructions

    When the user asks to create a commit message or commit changes:

    1. **Run tests first:**
       - Detect test framework from project (package.json, Cargo.toml, pyproject.toml, etc.)
       - Run appropriate test command:
         - npm/yarn: `npm test` or `yarn test`
         - Rust: `cargo test`
         - Python: `pytest` or `python -m pytest`
         - Go: `go test ./...`
       - If tests fail:
         - Show failures to user
         - Ask: "Tests failing. Fix before commit, skip tests, or commit anyway?"
         - Only proceed with commit if user explicitly chooses to skip/ignore
       - If no test command found, proceed without testing

    2. **Gather context:**
       - Run `jj diff` to see current changes
       - Run `jj log -r @` to see the current change description
       - If working with specific revisions, use `jj diff -r <revision>`

    3. **Analyze changes:**
       - Identify the type: feat, fix, refactor, docs, test, chore, style, perf
       - Determine scope if clear from file paths
       - Summarize the "why" (intent) not just "what" changed

    4. **Generate message:**
       Format: `<type>(<scope>): <subject>`

       - Subject: imperative mood, lowercase, no period, < 72 chars
       - Body (optional): explain why, not what
       - Favor precision over verbosity

       Examples:
       - `feat(ui): add dark mode toggle`
       - `fix(auth): prevent token refresh loop`
       - `refactor(api): simplify error handling`

    5. **Handle immutable commits:**
       If you get error: `Commit ... is immutable`:
       - Explain that the commit is immutable
       - Suggest running the command with `--ignore-immutable` flag
       - Ask user if they want to proceed with the flag

    6. **Execute commit:**
       - Use `jj describe -m "message"` for current change
       - Or `jj describe -r <revision> -m "message"` for specific revision
       - If immutable and user approves, add `--ignore-immutable`

    ## Tool access
    allowed-tools:
      - Bash
      - Read
      - Grep

    ## Notes
    - Keep messages concise and clear
    - Focus on intent, not implementation details
    - Follow conventional commit format strictly
  '';

  home.file.".claude/skills/react-classlist/SKILL.md".text = ''
    ---
    name: react-classlist
    description: Organize long or disorganized className attributes in React components into semantic groups using cn() or className
    ---

    # React ClassName Organizer

    Organize className attributes in React components for readability and maintainability.

    ## When to trigger

    Refactor className when:
    1. Single-line className exceeds 80-100 characters
    2. Disorganized `cn()` or `classList()` calls exist
    3. User explicitly requests className organization

    ## Instructions

    1. **Choose utility function:**
       - Use `cn()` if already imported in the file
       - Otherwise, use standard `className`

    2. **Break into multiple lines:**
       - Each line should be semantically grouped
       - Lines should not exceed ~80 characters
       - Keep responsive modifiers with their base class

    3. **Group classes in this order:**
       - Layout (flex, grid, position type)
       - Spacing (gap, padding, margin)
       - Sizing (width, height, min/max)
       - Display & visibility
       - Typography (font, text-*)
       - Colors & backgrounds
       - Borders & effects
       - Positioning values (top, left, z-index)
       - Transitions & animations
       - Responsive variants (keep with base class)

    4. **Format:**
       ```jsx
       // Before:
       className="overflow-y-auto max-h-[50vh] md:max-h-auto flex-col gap-4 md:gap-2 pt-2 w-full md:w-auto"

       // After:
       className=cn(
         'flex-col gap-4 md:gap-2 pt-2',
         'w-full md:w-auto max-h-[50vh] md:max-h-auto',
         'overflow-y-auto scrollbar-hide'
       )
       ```

    5. **Keep together:**
       - Responsive modifiers with base: `'w-full md:w-auto'`
       - Related utilities: `'flex items-center justify-between'`

    ## Tool access
    allowed-tools:
      - Read
      - Edit
      - Grep

    ## Notes
    - Preserve all existing classes
    - Maintain semantic grouping over strict alphabetical order
    - Each line should be readable and cohesive
  '';

  home.file.".claude/skills/code-review/SKILL.md".text = ''
    ---
    name: code-review
    description: Review code diffs for bugs, edge cases, state issues, and consequences. Provide prioritized findings with specific fixes.
    ---

    # Code Review Skill

    Perform thorough code reviews focused on diffs, identifying bugs, edge cases, and design issues.

    ## When to trigger

    - User asks: "review this", "review my code", "check this"
    - Before creating commits or PRs
    - After significant changes

    ## Review Process

    1. **Get the diff:**
       - Run `git diff` or `jj diff` to see changes
       - For PRs: use `gh pr diff` or check specific commits
       - Focus review on what changed, not entire codebase

    2. **Analyze for issues:**
       - **Correctness:** Logic errors, edge cases, race conditions
       - **State management:** Stale closures, missing dependencies, ref issues
       - **Side effects:** Unintended consequences, cascading failures
       - **Error handling:** Missing checks, silent failures, poor recovery
       - **Performance:** N+1 queries, unnecessary re-renders, blocking operations
       - **Security:** Injection, auth bypass, secrets exposure
       - **API contracts:** Breaking changes, missing validation
       - **Testing gaps:** Untested paths, missing assertions

    3. **Format findings:**
       ```
       [Priority] [Category] [Title]

       [Detailed explanation of the issue, including:
        - What the problem is
        - Why it occurs (reference specific code)
        - What the impact/consequence is
        - Concrete suggestion to fix it]
       ```

       **Priority levels:**
       - P0: Critical (security, data loss, crashes)
       - P1: High (bugs, correctness issues, breaking changes)
       - P2: Medium (performance, maintainability, technical debt)
       - P3: Low (style, minor improvements, nice-to-haves)

       **Category badges:**
       - Badge: Issue type (Update, Default, Delete, etc.)
       - Or use: Bug, Perf, Security, State, API, Test, etc.

    4. **Example format:**
       ```
       P1 State collapseRef not updated when callback changes

       The snap-collapse logic calls collapseRef.current but the ref is set
       once on mount and never updated. After the user resizes, collapseRef.current
       still points to the initial function. When snap-collapse fires, it uses
       the function from initial render, so expanding restores the old width
       instead of current width.

       Update collapseRef.current in an effect or call the collapse callback directly.
       ```

    5. **Review principles:**
       - Focus on impact and consequences, not just "what's wrong"
       - Provide specific line references when possible
       - Suggest concrete fixes
       - Flag unintended consequences and edge cases
       - Be concise but thorough
       - Prioritize ruthlessly (not everything is P1)

    ## Tool access
    allowed-tools:
      - Bash
      - Read
      - Grep
      - Glob
      - Write

    ## Output method

    1. **Generate review** in the format above
    2. **Determine project name:**
       - Get current directory name or git repo name
       - Example: if in `/path/to/my-project`, project is `my-project`
    3. **Write to reviews directory:**
       - Create dir: `~/Developer/reviews/<project-name>/` if not exists
       - Write file: `~/Developer/reviews/<project-name>/review-<timestamp>.md`
       - This keeps reviews outside project so they won't be committed
    4. **Preview:**
       - Run `gh markdown-preview ~/Developer/reviews/<project-name>/<file>.md` in background
       - This starts a server and opens browser, but runs in background to yield control
       - User can stop server later with Ctrl+C or by killing the process
    5. **Output to terminal:**
       - Show file path where review was saved
       - Show summary: number of findings by priority (e.g., "Found 2 P1, 3 P2 issues")
       - Inform user that preview server is running in background

    ## Output format

    - List findings in priority order (P0 first, P3 last)
    - If no issues found, say "No issues found" (don't fabricate problems)
    - For clean code, acknowledge good patterns used
  '';

  home.file.".claude/skills/test-writer/SKILL.md".text = ''
    ---
    name: test-writer
    description: Write comprehensive tests with emphasis on ALL error paths, edge cases, and regression coverage for code changes
    ---

    # Test Writer Skill

    Generate comprehensive tests for code changes, with emphasis on error paths and edge cases.

    ## When to trigger

    - User asks: "write tests", "add tests for this", "test this"
    - After implementing new functionality
    - When reviewing code with missing test coverage

    ## Instructions

    1. **Analyze the code:**
       - Read the file/function to test
       - Identify: inputs, outputs, side effects, dependencies, error conditions
       - Check existing tests to match style/framework
       - List all possible error returns/throws

    2. **Determine test type:**
       - **Unit:** Pure functions, isolated logic
       - **Integration:** Component + hooks, API + DB interactions
       - **E2E:** Full user flows

    3. **Generate test cases (in priority order):**

       a. **Error paths (CRITICAL):**
          - Test EVERY error return/throw variant
          - Verify error types/messages remain stable
          - Why: Internal implementation changes break error handling
          - Error tests act as regression tests for refactors
          - Examples:
            - Rust: Test all `Err(...)` variants in Result
            - TypeScript: Test all thrown error types
            - Go: Test all error return values
            - Python: Test all raised exceptions

       b. **Happy path:**
          - Expected behavior with valid inputs
          - Primary use cases

       c. **Edge cases:**
          - Empty, null, undefined, zero
          - Boundary values (min, max, off-by-one)
          - Large inputs, deeply nested data
          - Special characters, unicode

       d. **State changes:**
          - Before/after assertions
          - Side effects verification

       e. **Concurrency/timing:**
          - Race conditions (if applicable)
          - Timeout scenarios

    4. **Test structure (AAA pattern):**
       ```typescript
       describe('functionName', () => {
         it('should [expected behavior] when [condition]', () => {
           // Arrange: Setup
           const input = ...

           // Act: Execute
           const result = functionName(input)

           // Assert: Verify
           expect(result).toBe(expected)
         })
       })
       ```

    5. **Test naming:**
       - Describe behavior, not implementation
       - `should return user when valid ID provided`
       - `should return NotFoundError when user does not exist`
       - `should throw ValidationError when email is invalid`
       - `should handle empty array without errors`

    6. **Error testing examples:**

       **Rust:**
       ```rust
       #[test]
       fn should_return_not_found_error_when_user_missing() {
           let result = get_user(999);
           assert!(matches!(result, Err(UserError::NotFound(_))));
       }

       #[test]
       fn should_return_validation_error_for_negative_id() {
           let result = get_user(-1);
           assert!(matches!(result, Err(UserError::InvalidId(_))));
       }
       ```

       **TypeScript:**
       ```typescript
       it('should throw NotFoundError when user does not exist', () => {
         expect(() => getUser(999)).toThrow(NotFoundError);
         expect(() => getUser(999)).toThrow('User not found');
       });
       ```

    7. **Coverage checklist:**
       - [ ] ALL error paths tested (every Err/throw variant)
       - [ ] Error messages/types verified (API contract stability)
       - [ ] All code branches executed
       - [ ] Edge cases covered
       - [ ] Mocks for external dependencies
       - [ ] State changes verified
       - [ ] No flaky tests (consistent results)

    ## Framework detection

    - Detect from imports: Jest, Vitest, pytest, RSpec, cargo test, etc.
    - Match existing test patterns in codebase
    - Use same mocking/assertion libraries
    - Follow project conventions (file naming, directory structure)

    ## Tool access
    allowed-tools:
      - Read
      - Write
      - Grep
      - Glob
      - Bash

    ## Output

    - Write complete test file or add to existing tests
    - Include necessary imports and setup/teardown
    - Group related tests in describe/context blocks
    - Add comments only for non-obvious test logic
    - Prioritize error path tests first
    - Ensure tests fail when implementation breaks

    ## Principles

    - Error tests are regression tests - treat them as API contracts
    - If a function can return 5 different errors, write 5 error tests
    - Test what users observe, not internal implementation
    - Make tests readable - they're documentation
    - Fast, isolated, deterministic tests only
  '';

  home.file.".claude/skills/explain-code/SKILL.md".text = ''
    ---
    name: explain-code
    description: Explain how code/features work by tracing execution flow. Saves markdown to ~/Developer/explanations/ and previews in browser.
    ---

    # Code Explainer Skill

    Explain how a feature or codebase works with focus on data flow and key logic.

    ## When to trigger

    - User asks: "how does this work", "explain this feature", "remind me how X works"
    - Before making changes to unfamiliar code
    - When revisiting old code

    ## Instructions

    1. **Identify scope:**
       - Ask user what feature/file/function to explain if unclear
       - For features: find entry points (routes, components, CLI commands)
       - For files: focus on that file and its direct dependencies

    2. **Map the flow:**
       - Trace execution path from entry to exit
       - Identify key decision points (if/match statements, loops)
       - Note external calls (APIs, DB, file I/O)
       - Track state changes and side effects

    3. **Extract key info:**
       - **Purpose:** What problem does this solve?
       - **Entry points:** Where does execution start?
       - **Data flow:** Input → transformations → output
       - **Key logic:** Important algorithms, validations, business rules
       - **Side effects:** DB writes, API calls, file changes, state updates
       - **Dependencies:** External libs, services, other modules

    4. **Output format:**
       ```
       ## What it does
       [1-2 sentence summary]

       ## How it works
       1. [Step 1 with file:line references]
       2. [Step 2 with file:line references]
       3. [Step 3...]

       ## Key files
       - path/to/file.ts:123 - [what happens here]
       - path/to/other.rs:45 - [what happens here]

       ## Important logic
       [Any non-obvious algorithms, validations, or business rules]

       ## External dependencies
       [APIs called, DB tables used, services involved]

       ## Gotchas
       [Edge cases, assumptions, constraints, footguns]
       ```

    5. **Focus on:**
       - The "why" behind non-obvious code
       - Critical paths and error handling
       - State mutations and side effects
       - Include file:line references for easy navigation

    6. **Keep concise:**
       - Skip obvious stuff (standard library usage, simple getters)
       - Focus on the unique/complex parts
       - Summarize repeated patterns instead of listing each instance

    ## Tool access
    allowed-tools:
      - Read
      - Grep
      - Glob
      - Bash
      - Write

    ## Output method

    1. **Generate explanation** in the format above
    2. **Determine project name:**
       - Get current directory name or git repo name
       - Example: if in `/path/to/my-project`, project is `my-project`
    3. **Write to explanations directory:**
       - Create dir: `~/Developer/explanations/<project-name>/` if not exists
       - Write file: `~/Developer/explanations/<project-name>/<feature-name>-<timestamp>.md`
       - Use feature name from user query (e.g., "auth", "parser", "sync-logic")
       - This keeps explanations outside project so they won't be committed
    4. **Preview:**
       - Run `gh markdown-preview ~/Developer/explanations/<project-name>/<file>.md` in background
       - This starts a server and opens browser, but runs in background to yield control
       - User can stop server later with Ctrl+C or by killing the process
    5. **Output to terminal:**
       - Show file path where explanation was saved
       - Show brief summary
       - Inform user that preview server is running in background

    ## Examples

    **User:** "How does authentication work?"
    **Output:**
    ```
    ## What it does
    JWT-based auth with refresh tokens. Access tokens expire in 15min, refresh in 7 days.

    ## How it works
    1. User sends credentials to /api/auth/login (routes/auth.ts:23)
    2. Validate against DB, generate access + refresh tokens (lib/auth.ts:45)
    3. Store refresh token in httpOnly cookie (lib/auth.ts:67)
    4. Middleware validates access token on protected routes (middleware/auth.ts:12)
    5. If expired, /api/auth/refresh issues new access token (routes/auth.ts:89)

    ## Key files
    - routes/auth.ts:23 - Login endpoint, credentials validation
    - lib/auth.ts:45 - Token generation with JWT
    - middleware/auth.ts:12 - Token verification on each request

    ## Important logic
    - Tokens signed with RS256 (private key in env)
    - Refresh rotation: old token invalidated after refresh
    - Rate limiting: 5 login attempts per 15min per IP

    ## Gotchas
    - Refresh tokens stored in DB, must clear on logout
    - Clock skew tolerance: 30 seconds
    - CORS credentials must be true for cookies
    ```

    ## Principles

    - Assume the user wrote this but forgot
    - Be a helpful reminder, not a lecture
    - Trace the actual execution path
    - Point to specific lines for deep-dive
    - Highlight non-obvious decisions
  '';
}
