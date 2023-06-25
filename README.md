
<a name="readme-top"></a>

# 📗 Table of Contents
- [📗 Table of Contents](#-table-of-contents)
- [📖 api\_for\_asana ](#-api_for_asana-)
  - [Installation ](#installation-)
    - [Usage](#usage)
      - [To get all section](#to-get-all-section)
      - [To update the section](#to-update-the-section)
      - [To delete the section](#to-delete-the-section)
      - [To create new section](#to-create-new-section)
    - [Run Test](#run-test)
  - [👥 Authors ](#-authors-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)

# 📖 api_for_asana <a name="about-project"></a>

This gem is an API wrapper for interacting with Asana. It allows me to create sections, retrieve tasks from a given section, update sections, and delete sections.

## Installation <a name="tech-stack"></a>

Add the following code to you Gemfile 

```ruby
gem 'api_for_asana'
```

Then run 

`bundler install`
    

### Usage

`include` this gem on your controller like.

```ruby
class HomesController < ApplicationController
  include ApiForAsana

  ...

  end

```




#### To get all section 
 
 Use get_sections method like below 

```ruby
 get_sections

 ```
#### To update the section 
 
 Use update_section method like below 

```ruby
 update_section(id, name)
 
 ```
#### To delete the section 
 
 Use delete_section method like below 

```ruby
 delete_section(id)
 
 ```

#### To create new section
 
 Use create_section method like below 

```ruby
 create_section(name)

 ```
 ### Run Test
  on your terminal run 
 `rspec spec`

## 👥 Authors <a name="authors"></a>

 👤 Melashu Amare

- GitHub: [@melashu](https://github.com/melashu)
- Twitter: [@meshu102](https://twitter.com/meshu102)
- LinkedIn: [Melashu Amare](https://www.linkedin.com/in/melashu-amare/)

## 🤝 Contributing <a name="contributing"></a>

This repo is open for contributions. Issues, and feature requests are welcome!

Feel free to check the [issues page.](https://github.com/melashu/api_for_asana/issues)

## ⭐️ Show your support <a name="support"></a>

Give a star if you like this project!
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>
