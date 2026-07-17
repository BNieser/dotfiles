-- Add some detection that it rcogines an typical ansible setup with the correct files
vim.filetype.add({
    pattern = {
        [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
        [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbook.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
    },
})

-- the same for docker compose files
vim.filetype.add({
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
    },
})
