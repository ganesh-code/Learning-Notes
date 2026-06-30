# AWS IAM Notes

## Core Components

- IAM User: Permanent identity for humans.
- IAM Group: Collection of users with shared permissions.
- IAM Role: Temporary identity assumed by services or users.
- IAM Policy: JSON document defining permissions.

## Policy Types

- AWS Managed: Maintained by AWS.
- Customer Managed: Created and managed by the organization.
- Inline: Attached to a single identity; not reusable.

## Security Best Practices

- Never use the root account for daily work.
- Enable MFA on the root account immediately.
- Follow the Principle of Least Privilege.
- Prefer IAM Roles over access keys for AWS services.
- Regularly review and remove unnecessary permissions.

## Useful Commands

aws configure

aws sts get-caller-identity

aws iam simulate-principal-policy
