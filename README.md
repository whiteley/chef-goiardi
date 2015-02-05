# goiardi-cookbook

Installs and configures [Goiardi](http://goiardi.gl).

## Supported Platforms

* Ubuntu 12.04
* Ubuntu 14.04

## Attributes

<table>
  <tr>
    <td><tt>[:goiardi][:version]</tt></td>
    <td>String</td>
    <td>Goiardi version to install</td>
    <td><tt>0.9.0</tt></td>
  </tr>
  <tr>
    <td><tt>[:goiardi][:arch]</tt></td>
    <td>String</td>
    <td>Goiardi only runs on amd64</td>
    <td><tt>amd64</tt></td>
  </tr>
  <tr>
    <td><tt>[:goiardi][:confdir]</tt></td>
    <td>String</td>
    <td>Goiardi configuration directory</td>
    <td><tt>/etc/goiardi</tt></td>
  </tr>
  <tr>
    <td><tt>[:goiardi][:rundir]</tt></td>
    <td>String</td>
    <td>Goiardi state directory</td>
    <td><tt>0.9.0</tt></td>
  </tr>
</table>

## Usage

### goiardi::default

Include `goiardi` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[goiardi::default]"
  ]
}
```

## License and Authors

Author:: Matt Whiteley (<mwhiteley@fastly.com>)
