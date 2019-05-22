require 'database_connection'

describe DatabaseConnection do
  it 'creates a database connection when in the test environment' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup("bookmark_manager_test")
  end

  it 'returns a connection to use' do
    connection = DatabaseConnection.setup("bookmark_manager_test")
    expect(DatabaseConnection.connection).to eq connection
  end

  it 'runs a query on the database connection' do
    connection = DatabaseConnection.setup("bookmark_manager_test")

    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
    DatabaseConnection.query("SELECT * FROM bookmarks;")
  end

end
