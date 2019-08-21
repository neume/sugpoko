# Sugpoko

Modularize your pdf code with this gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prawn'
gem 'sugpoko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sugpoko

## Usage

Create a class that inherits `Sugpoko::Base`. This class is the main pdf component
where the pdf generation is triggered. It includes `Prawn::View` module.

``` ruby
class PdfDocument < Sugpoko::Base
  def generate
    pdf.text 'Hello World'
  end
end

PdfDocument.new.generate
# Hello world
```

A component can also be created using `Sugpoko::Component`

``` ruby
class Header < Sugpoko::Component
  def generate
    pdf.text 'This is a header'
  end
end
```

To add `Header` on our previous base document, use `draw` method. It accepts a
class that inherits from either `Sugpoko::Base` or `Sugpoko::Component`.
``` ruby
class PdfDocument < Sugpoko::Base
  def generate
    draw Header
    pdf.text 'Hello World'
    draw ...
  end
end

PdfDocument.new.generate
# This is a Header
# Hello World
```

`Sugpoko::Component` can also use `draw` method



Bug reports and pull requests are welcome on GitHub at https://github.com/neume/sugpoko.
