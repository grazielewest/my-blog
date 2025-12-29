#!/bin/bash

echo "🚀 Building site with Hugo..."
hugo

echo "📤 Deploying to GitHub Pages..."
cd public

# Initialize if needed
if [ ! -d ".git" ]; then
    git init
    git remote add origin https://github.com/grazielewest/grazielewest.github.io.git
fi

# Add all files
git add .

# Commit
git commit -m "Deployed: $(date)"

# Force push (overwrites remote)
git push origin main --force

cd ..
echo "✅ Deployment complete!"
echo "🌐 Your site: https://grazielewest.github.io"
echo "⏳ It may take 1-2 minutes to update..."