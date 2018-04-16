# Put here global static variable if any.
global.options <- list(
  file.names = list(
    # main files...
    bank.agencies = file.path('./data', 'bankagencies.csv'),
    bank.accounts = file.path('./data', 'bankaccounts.csv'),
    operations = file.path('./data', 'operations.csv'),
    categories = file.path('./data', 'categories.csv'),
    subcategories = file.path('/data', 'subcategories.csv'),
    labels = file.path('/data', 'labels.csv'),
    # back-up files
    backup.bank.agencies = file.path('./data', 'bankagencies.bup.csv'),
    backup.bank.accounts = file.path('./data', 'bankaccounts.bup.csv'),
    backup.operations = file.path('./data', 'operations.bup.csv'),
    backup.categories = file.path('./data', 'categories.bup.csv'),
    backup.subcategories = file.path('/data', 'subcategories.bup.csv'),
    backup.labels = file.path('/data', 'labels.bup.csv')
  )
)