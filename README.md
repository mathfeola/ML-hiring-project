
### 💡 Demo

Este projeto utiliza um Gemfile para controlar as versões de ruby
e das ferramentas utilizadas. Recomenda-se o uso de algum
versionador de ruby como [rbenv](https://github.com/rbenv/rbenv) ou o [rvm](https://github.com/rvm/rvm) para a execução.

### 📲 Instalação

#### Usando [Bundler](https://bundler.io/)

```ruby
gem install 'bundler'
```

```ruby
bundle install
```

```ruby
bundle exec pod install
```

### 👨🏻‍💻 Gerando code coverage

Edit your `Cartfile` and specify the dependency:

```ruby
bundle exec fastlane test
```

```bash
open xcov_report/index.html
```
