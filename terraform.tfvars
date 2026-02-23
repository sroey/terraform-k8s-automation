kubeconfig_path = "~/.kube/config"

app_configs = {
  primary = {
    name            = "webapp-primary"
    replica_count   = 6
    display_message = "Welcome to Primary Stack!"
  }
  bonus = {
    name            = "webapp-bonus"
    replica_count   = 2
    display_message = "Welcome to Bonus Stack!"
  }
}
