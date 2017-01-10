# == Class: dim_test
#
# Full description of class dim_test here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class dim_test (
  $filename
) {

  # Get value from hiera with module_data aswell
  $value = hiera('file_contents', 'empty')

  # Output value
  file { "/tmp/${filename}.txt":
    content => $value,
    mode    => '0644'
  }

}
