resource "kubernetes_persistent_volume_claim" "jenkins-pvc" {
  metadata {
    name = "terraform-jenkins"
    namespace = "tools"
  }
 
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests {
        storage = "15Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.example.metadata.0.name}"
  }
}