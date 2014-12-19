AdminUser CRUD

Model

- define #name which returns `first_name` and `last_name` with space
  between
- define a named scope called #sorted that orders by `last_name`
  then `first_name`

Controller

- Generate AdminUsersController
- Remove the auto-generated routes
- Use 'admin' laout
- Restrict access to all actions to logged in users
- Actions:  index, new, create edit, update, delete, destroy
- No show action/template
- index:  AdminUsers sorted by `last_name` then `first_name`
- Use strong parameters to permit mass-assignment

Views

- Set HTML page title in each template `@page_title`
- Use view helpers:  `link_to mail_to pluralize cycle`
- Use for helpers:
  `form_for label text_field password_field submit_tag`
- display form errors

Views
- Add link in access/index.html.erb to admin users CRUD
- Add link from `admin_users/index.html.erb` back to the main menu
