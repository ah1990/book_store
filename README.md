# Book store

## Instalation

```
bundle install
rake db:setup
rake db:migrate
rake db:seed

rails s
```

## API Requests

#### List of shops selling at least one book of chosen publisher

```
[GET] 0.0.0.0:3000/api/mobile/v1/shops/publisher/:id/books
```

#### Mark a current book in shop as sold

```
[PUT] 0.0.0.0:3000/api/mobile/v1/shops/:shop_id/book/:book_id/mark_as_sold
```
###### body
```
{
  books_count: some_value
}
```