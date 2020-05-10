{ serviceAccountName : Text
, replicas : Natural
, exports : Optional (List ( ../Export/Type.dhall ))
, annotations : Optional (List { mapKey : Text, mapValue : Text })
}