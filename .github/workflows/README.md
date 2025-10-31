# Repository Deployment Setup

This document explains how to configure the automatic deployment workflow that syncs the content of `igs/imaging-r4` and `igs/imaging-r5` folders to separate repositories.

## Required Setup

### 1. GitHub Secrets

You need to create the following secret in your repository settings:

#### `DEPLOY_TOKEN`
- **Type**: Repository Secret
- **Description**: A GitHub Personal Access Token with repository permissions
- **How to create**:
  1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
  2. Generate a new token with the following scopes:
     - `repo` (Full control of private repositories)
     - `workflow` (Update GitHub Action workflows)
  3. Copy the token and add it as a secret named `DEPLOY_TOKEN`

### 2. Repository Variables (Optional)

You can optionally configure the following variables to specify custom repository URLs:

#### `R4_REPO_URL`
- **Type**: Repository Variable
- **Default**: `oijauregui/ehdsimaging-r4`
- **Description**: The target repository for R4 content in format `owner/repo-name`

#### `R5_REPO_URL`
- **Type**: Repository Variable
- **Default**: `oijauregui/ehdsimaging-r5`
- **Description**: The target repository for R5 content in format `owner/repo-name`

### 3. Target Repository Setup

Make sure the target repositories (`ehdsimaging-r4` and `ehdsimaging-r5`) exist and the token has write access to them.

## How It Works

The workflow (`deploy-to-repos.yml`) triggers on any push to any branch and:

1. **Preprocessing**: Runs `_preprocessMultiVersion.sh` to prepare the files
2. **R4 Deployment**:
   - Clones the target R4 repository
   - Creates or switches to the same branch name as the source
   - Syncs the content from `igs/imaging-r4/` to the root of the target repository
   - Commits and pushes changes if any exist
3. **R5 Deployment**:
   - Clones the target R5 repository
   - Creates or switches to the same branch name as the source
   - Syncs the content from `igs/imaging-r5/` to the root of the target repository
   - Commits and pushes changes if any exist

## Branch Handling

- The workflow preserves branch names across repositories
- If a branch doesn't exist in the target repository, it creates a new one
- If a branch exists, it updates the existing branch

## Security Notes

- The `DEPLOY_TOKEN` should be kept secure and rotated regularly
- Consider using fine-grained personal access tokens for better security
- The token should have minimal required permissions (repository access only)

## Troubleshooting

### Common Issues

1. **Permission Denied**: Ensure the `DEPLOY_TOKEN` has write access to target repositories
2. **Repository Not Found**: Check that the repository URLs are correct and accessible
3. **Branch Creation Fails**: Ensure the token has permission to create branches

### Viewing Workflow Logs

1. Go to the Actions tab in your GitHub repository
2. Select the "Deploy to Separate Repositories" workflow
3. Click on a specific run to view detailed logs for each step