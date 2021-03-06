Dado('que eu esteja na pagina inicial') do
  page_home.load
  expect(page.current_url).to eql(BASE_URL)
  screenshot
end

Quando('eu pesquisar por {string}') do |text_pesq|
  page_home.preencher_form_pesq(text_pesq)
  screenshot
  page_home.pesquisar
end

Entao('me retorna os resultados indexados') do
  expect(page).to have_content 'Aproximadamente '
  screenshot
end

Quando('eu pesquisar sem preencher o assunto') do
  page_home.preencher_form_pesq('')
end

Entao('continuarei na mesma pagian aguardando um assunto') do
  expect(page.current_url).to eql(BASE_URL)
end
