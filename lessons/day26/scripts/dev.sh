#!/bin/bash

RESOURCE_GROUP_NAME=terraform-state-rg
STAGE_SA_ACCOUNT=tf-stage-backend
DEV_SA_ACCOUNT=tf-dev-backend
DEV_CONTAINER_NAME=devtfstate
STG_CONTAINER_NAME=stgtfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location canadacentral

# Create storage account for staging environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STAGE_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create storage account for dev environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $DEV_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create blob container for staging environment
az storage container create --name $STG_CONTAINER_NAME --account-name $STAGE_SA_ACCOUNT

# Create blob container for dev environment
az storage container create --name $DEV_CONTAINER_NAME --account-name $DEV_SA_ACCOUNT