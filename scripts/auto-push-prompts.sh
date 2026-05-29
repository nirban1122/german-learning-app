#!/bin/bash
# Auto-push script for AI Engine prompt templates
# This script checks if any prompt templates were modified and auto-pushes them.
# Run: ./scripts/auto-push-prompts.sh

set -e

# Check for changes in prompt templates
CHANGED=$(git diff --name-only HEAD~1 HEAD 2>/dev/null | grep "ai-engine/training/promptTemplates/" || echo "")

if [ -n "$CHANGED" ]; then
  echo "📝 Prompt templates changed:"
  echo "$CHANGED"
  echo "🚀 Auto-pushing to GitHub..."
  git push origin main
  echo "✅ Pushed successfully!"
else
  echo "ℹ️  No prompt template changes detected."
fi
