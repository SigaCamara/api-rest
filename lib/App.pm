package App;

use Mojo::Base 'Mojolicious';
use App::Model::Bairros;
use Mojo::mysql;

sub startup {
  my $self = shift;

  # Configuration
  $self -> plugin('Config');
  $self -> secrets($self -> config('secrets'));

  # Model
  $self -> helper (
    mysql => sub {
      state $mysql = Mojo::mysql -> new (
        shift->config('mysql')
      )
    }
  );

  $self -> helper(
    bairros => sub {
      state $bairros = App::Model::Bairros -> new (
        mysql => shift -> mysql
      )
    }
  );

  # Migrate to latest version if necessary
  my $path = $self -> home -> child('migrations', 'app.sql');
  $self -> mysql -> auto_migrate(1) -> migrations -> name('app') -> from_file($path);

  # Controllers
  my $routes = $self -> routes();

  $routes -> get('/' => sub {
    shift -> redirect_to('bairros')
  });

  $routes -> get('/bairros') -> to ('bairros#index');
}

1;
