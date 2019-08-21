# Prawnko

Modularize your pdf code with this gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prawn'
gem 'prawnko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prawnko

## Usage

Create a class that inherits `Prawnko::Base`. This class is the main pdf component
where the pdf generation is triggered. It includes `Prawn::View` module.

``` ruby
class PdfDocument < Prawnko::Base
  def generate
    pdf.text 'Hello World'
  end
end

PdfDocument.new.generate
# Hello world
```

A component can also be created using `Prawnko::Component`

``` ruby
class Header < Prawnko::Component
  def generate
    pdf.text 'This is a header'
  end
end
```

To add `Header` on our previous base document, use `draw` method. It accepts a
class that inherits from either `Prawnko::Base` or `Prawnko::Component`.
``` ruby
class PdfDocument < Prawnko::Base
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

`Prawnko::Component` can also use `draw` method



Bug reports and pull requests are welcome on GitHub at https://github.com/neume/prawnko.
