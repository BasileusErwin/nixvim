{
  plugins.comment = {
    enable = true;
  };

  extraConfigLua = ''
    local ft = require('Comment.ft')

    ft({ 'ignis' }, ft.get('c'))
  '';
}
