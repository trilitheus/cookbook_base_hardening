include_recipe 'sysctl::default'

node['base_hardening']['sysctl'].each do |k, v|
  sysctl_param k do
    value v
    # TODO: Need to get this guard correct
    # not_if [[ "$(sysctl #{k})" == "#{k} = #{v}" ]]
  end
end
