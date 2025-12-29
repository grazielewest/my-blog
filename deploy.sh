#!/bin/bash

echo "🚀 Building site..."
hugo

echo "📤 Deploying to GitHub Pages..."

# Create a fresh clone of the pages repo
cd /tmp
rm -rf deploy-temp
git clone https://github.com/grazielewest/grazielewest.github.io.git deploy-temp
cd deploy-temp

# Remove everything except .git
find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +

# Copy the built site
cp -r ~/Documents/my-blog/public/* .

# Deploy
git add .
git commit -m "Deployed: $(date)"
git push origin main --force

cd ~/Documents/my-blog
echo "✅ Done! Visit: https://grazielewest.github.io"
