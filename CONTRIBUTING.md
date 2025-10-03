# Contributing to synonym.nvim

Thank you for your interest in contributing to synonym.nvim! This document provides guidelines for contributing to the project.

## Development Setup

1. **Prerequisites**:
   - Neovim 0.8 or later
   - Lua 5.1 or later
   - Git

2. **Clone the repository**:
   ```bash
   git clone https://github.com/IdoKendo/synonym.nvim.git
   cd synonym.nvim
   ```

3. **Install dependencies**:
   The plugin depends on:
   - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
   - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## Development Workflow

### Linting and Formatting
- **Lint**: `stylua --check lua/`
- **Format**: `stylua lua/`

Ensure all code is properly formatted before submitting a change request.

### Code Style
- **Formatting**: 4 spaces indentation (enforced by stylua)
- **Imports**: Use `local` for all requires at the top of the file
- **Modules**: Export functions via `M.function_name` pattern
- **Naming**: snake_case for variables/functions, PascalCase for modules
- **Error Handling**: Use `vim.notify()` for user messages, `log.debug()` for debugging
- **Async**: Use plenary.Job for HTTP requests and async operations
- **JSON**: Use `vim.json` for encoding/decoding
- **Logging**: Use plenary.log with plugin-specific logger
- **UI**: Use telescope pickers for user interactions
- **LSP**: Use vim.lsp.buf for refactoring operations

## Submitting Changes

1. **Fork the repository** and create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the code style guidelines.

3. **Run tests** and ensure they pass.

4. **Format your code**:
   ```bash
   stylua lua/
   ```

5. **Commit your changes** with a clear, descriptive commit message.

6. **Push to your fork** and **create a pull request**.

### Pull Request Guidelines
- Provide a clear description of the changes
- Reference any related issues
- Ensure all tests pass
- Follow the code style guidelines
- Keep changes focused and atomic
- Follow [Conventional Commit](https://www.conventionalcommits.org/) for PR titles

## Reporting Issues

When reporting bugs or requesting features:
- Use the GitHub issue tracker
- Provide detailed steps to reproduce
- Include Neovim version, OS, and any relevant configuration
- For bugs, include error messages and stack traces if available

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project (see LICENSE file).
