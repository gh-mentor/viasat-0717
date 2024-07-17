# this bash script uses git commands to stage, commit, and push changes to the 'main' branch of the remote repository.

# Stage all changes
git stage .

# Commit changes
git commit -m "Update"

# Push changes to remote repository
git push origin main