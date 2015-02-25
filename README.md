tomcat-users Cookbook
=====================

Adding a new user
-----------------

Create a tomcat user with associated roles:

```ruby
tomcat_user 'hello' do
  tomcat_config '/tomcat/path/to/tomcat-users.xml'
  roles [ 
    { :id => "user1", :password => "pwd1", :roles => ["role1", "role2"] }
    { :id => "user2", :password => "pwd2", :roles => ["role1"] }
  ]

  action :create
end
```

