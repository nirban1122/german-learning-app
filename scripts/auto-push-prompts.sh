#!/bin/bash
# Auto-push script for prompts (PROMPT.md + prompt templates)
# Watches for changes to PROMPT.md and ai-engine/training/promptTemplates/
# Run: ./scripts/auto-push-prompts.sh

set -e

# Check for changes in PROMPT.md or prompt templates
CHANGED=$(git diff --name-only HEAD~1 HEAD 2>/dev/null | grep -E "^(PROMPT\.md|ai-engine/training/promptTemplates/)" || echo "")

if [ -n "$CHANGED" ]; then
  echo "📝 Prompt changes detected:"
  echo "$CHANGED"
  echo "🚀 Auto-pushing to GitHub..."
  git push origin main
  echo "✅ Pushed successfully!"
else
  echo "ℹ️  No prompt changes detected."
fi
