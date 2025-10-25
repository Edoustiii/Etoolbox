import { writeFileSync } from 'fs'
import { resolve } from 'path'

const script = `
#!/usr/bin/env sh

# abort on errors
set -e

# build
echo "Building VitePress site..."
npm run build

# navigate into the build output directory
cd docs/.vitepress/dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

echo "Initializing git repository..."
git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# Replace <USERNAME> and <REPO> with your GitHub username and repository name
# git push -f git@github.com:<USERNAME>/<REPO>.git main:gh-pages

echo "Build complete! Files are in docs/.vitepress/dist"
echo "To deploy, run: cd docs/.vitepress/dist && git push -f git@github.com:USERNAME/REPO.git main:gh-pages"

cd -
`

writeFileSync(resolve(process.cwd(), 'deploy.sh'), script)
console.log('✅ deploy.sh created successfully!')
