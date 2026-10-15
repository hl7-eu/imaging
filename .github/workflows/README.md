# Repository Validation and Deployment Setup

This document explains how to configure the automatic validation and deployment workflow that:
1. Validates R4 and R5 IGs using the FHIR IG Publisher
2. Only deploys to child repositories if validation passes successfully
3. Syncs the content of `igs/imaging-r4` and `igs/imaging-r5` folders to separate repositories

## Required Setup

### Manual child-repository synchronization

The source repository's `_commitToMainRepos.sh` additionally synchronizes the
standalone R4 API project from `ig-api/` to `hl7-eu/imaging-api`, alongside
Imaging R4/R5. It uses matching branches, excludes generated/cache files, and
supports `--api-only` and `--no-push`. See the root [README](../../README.md)
for build prerequisites and safeguards.

The GitHub Actions jobs described below are separate from this script and do
not invoke it. Adding API support to the manual script does not add an automatic
API deployment job or register the API guide for CI publication. Ensure a
`DEPLOY_TOKEN` used by the script can write to all selected child repositories;
the script does not store the token in remote URLs.

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

The workflow (`deploy-to-repos.yml`) triggers on any push to any branch and follows this sequence:

### **Step 1: Validation (Parallel)**
- **validate-r4**: Validates the R4 IG
  - Runs preprocessing (`_preprocessMultiVersion.sh`)
  - Updates IG Publisher
  - Runs full validation (`_genonce.sh`)
- **validate-r5**: Validates the R5 IG
  - Runs preprocessing (`_preprocessMultiVersion.sh`)
  - Updates IG Publisher
  - Runs full validation (`_genonce.sh`)

### **Step 2: Deployment (Only if validation passes)**
If both validations succeed:
- **deploy-r4**: Deploys to R4 repository
  - Runs preprocessing
  - Clones target R4 repository
  - Creates or switches to the same branch name as the source
  - Syncs content from `igs/imaging-r4/` to repository root
  - Commits and pushes changes
  - Creates build trigger for auto-ig-builder
- **deploy-r5**: Deploys to R5 repository
  - Runs preprocessing
  - Clones target R5 repository
  - Creates or switches to the same branch name as the source
  - Syncs content from `igs/imaging-r5/` to repository root
  - Commits and pushes changes
  - Creates build trigger for auto-ig-builder

**If validation fails**: Deployment is skipped and the workflow stops with an error.

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