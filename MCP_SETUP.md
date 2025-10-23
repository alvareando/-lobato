# MCP (Model Context Protocol) Setup

This document describes the MCP servers installed for this project to enable internet fetching capabilities.

## Installed MCP Servers

### 1. Fetch Server (mcp-server-fetch-typescript)

A Model Context Protocol server that provides web content fetching and conversion capabilities.

**Features:**
- Fetches web content from URLs
- Converts HTML to Markdown for easier LLM consumption
- Uses Playwright for reliable content extraction

**Installation:**
```bash
npm install -g mcp-server-fetch-typescript
```

**Binary Location:** `/opt/node22/bin/mcp-server-fetch-typescript`

## Configuration

The MCP configuration is stored in `~/.config/claude/mcp_config.json`:

```json
{
  "mcpServers": {
    "fetch": {
      "command": "/opt/node22/bin/mcp-server-fetch-typescript",
      "args": [],
      "env": {}
    }
  }
}
```

## Usage

Once configured, Claude Code will automatically have access to tools provided by the fetch MCP server, allowing it to:
- Fetch and read web pages
- Convert web content to markdown
- Extract information from websites

## Troubleshooting

If the MCP server is not working:

1. Verify the server is installed:
   ```bash
   which mcp-server-fetch-typescript
   ```

2. Check the configuration file exists:
   ```bash
   cat ~/.config/claude/mcp_config.json
   ```

3. Ensure the binary path in the config matches the installed location

## Additional Resources

- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
- [mcp-server-fetch-typescript on npm](https://www.npmjs.com/package/mcp-server-fetch-typescript)
