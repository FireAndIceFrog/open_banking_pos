# Description
We are implementing a POC for the open banking schema that the akahu api. 

when writing features we want to develop it feature-first. That means everything for a feature is contained in a feature folder like this

akahu-api/features/
-types
-services
-repositories

All shared services and types are put into the features/foundation folder.

We aim to keep this as simple as possible for now.

# Features
## Account listing
GET api/v1/accounts