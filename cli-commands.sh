# Perform common tasks using the Globus Command Line Interface (CLI)
# Note: Commands typically require UUIDs to identify resources (collections, users, etc.)

export SOURCE="" 

# Find endpoint using text search
globus endpoint search 'PEARC22 Tutorial'

# List my tasks
globus task list

# Find identity ID (and/or identity name)
globus get-identities YOUR_IDENTITY_NAME
globus get-identities bfc122a3-af43-43e1-8a41-d36f28a2bc0a

# Create the endpoint
export SRC=SOURCE_COLLECTION_ID
export DST=DESTINATION_COLLECTION_ID
globus transfer --recursive $SRC:/~/carousel $DST:/globusworkshop

# Get details about a transfer task
globus task show TRANSFER_TASK__UUID

# Grant a user "READ" permission on the guest collection
globus endpoint permission create --permissions r --identity demodoc@globusid.org $SHARE:/globusworkshop/
globus endpoint permission list $SHARE
globus endpoint permission delete $SHARE PERMISSION_UUID

# Search using filters
globus endpoint search --filter-scope my-endpoints

# Set command output to JSON
globus endpoint search --filter-scope my-endpoints --format json

# Parse endpoint results using a JMESPath query
globus endpoint search --filter-scope my-endpoints --jmespath 'DATA[].[id, display_name]'
