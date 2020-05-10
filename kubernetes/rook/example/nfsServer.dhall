let rook = ../package.dhall

let k8s =
        ../../k8s/1.15.dhall sha256:4bd5939adb0a5fc83d76e0d69aa3c5a30bc1a5af8f9df515f44b6fc59a0a4815
      ? ../../k8s/1.15.dhall

let nfsserver = rook.NFSServer::{
  , metadata = k8s.ObjectMeta::{
    , name = "default"
    }
  , spec = rook.NFSServerSpec::{
    , serviceAccountName = "rook-nfs"
    , exports = Some [ rook.Export::{
      , name = "default"
      , server = rook.ServerConfig::{
        , accessMode = "ReadWrite"
        , squash = "none"
        }
      , persistentVolumeClaim = rook.PersistentVolumeClaimRef::{
        , claimName = "nfs-default-claim"
        }
      } ]
    }
  }
in nfsserver