#!/bin/sh

##This script create a azure container registry
 
ACR_RESOURCE_GROUP_NAME="acr-rg"
ACR_NAME="1130118777"
LOCATION="australiaeast"
 
# Create a resource group to store container registry
az group create --name $ACR_RESOURCE_GROUP_NAME --location $LOCATION
 
# Create a container registry that will be where you deploy your image to
az acr create --resource-group $ACR_RESOURCE_GROUP_NAME --name $ACR_NAME --sku Basic


##Delete the resource
##az group delete --name $ACR_RESOURCE_GROUP_NAME
