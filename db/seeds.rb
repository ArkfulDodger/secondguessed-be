puts '🌱 Seeding..... 🌱'

# reset tables here
Guess.destroy_all
Guess.reset_pk_sequence
Image.destroy_all
Image.reset_pk_sequence
User.destroy_all
User.reset_pk_sequence
Word.destroy_all
Word.reset_pk_sequence

# seed data here
puts 'Seeding Images...'

# binding.pry
img =
  Image.create(
    url:
      'https://d2u3kfwd92fzu7.cloudfront.net/asset/cms/Art_Basel_Hong_Kong_2021_Partners-3-1.jpg',
    alt:
      'abstract artwork in bright reds and oranges, resembling lava flow or oils',
    start_time: Time.now.to_f * 1000 - (12 * 60 * 1000)
  )
Image.create(
  url:
    'https://i.picsum.photos/id/1006/3000/2000.jpg?hmac=x83pQQ7LW1UTo8HxBcIWuRIVeN_uCg0cG6keXvNvM8g',
  alt: 'Woman sits on top of mountain hugging her dog',
  start_time: Time.now.to_f * 1000 - (11 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk',
  alt: 'Woman sits in front of canoe, paddling on a lake',
  start_time: Time.now.to_f * 1000 - (10 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y',
  alt: 'Pug sits on trail in the woods, wrapped in a blanket',
  start_time: Time.now.to_f * 1000 - (9 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/1028/5184/3456.jpg?hmac=WhttNfn25eTgLTNnhRujSq4IVjx2mMa6wvPG1c6qMVc',
  alt: 'Smoky landscape of burned trees',
  start_time: Time.now.to_f * 1000 - (8 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/1040/4496/3000.jpg?hmac=kvZONlBpTcZ16PuE_g2RWxlicQ5JKVq2lqqZndfafBY',
  alt: 'Landscape of green forest and a castle on top of a hill',
  start_time: Time.now.to_f * 1000 - (7 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/1084/4579/3271.jpg?hmac=YblMazviSugJVfZsFPaFI_Vp6lBeQin62qpm8rxHruo',
  alt: 'Two walruses on a sandy beach',
  start_time: Time.now.to_f * 1000 - (6 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/129/4910/3252.jpg?hmac=g1KzJMIp75lG_scR48R1baC6TjhVmkEyygSyngKYRsg',
  alt: 'A couple sits on a bench looking out at the Golden Gate bridge',
  start_time: Time.now.to_f * 1000 - (5 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/156/2177/3264.jpg?hmac=hjKWxNR5fYw1fbGYXknGDH6eRORZ_AlTeQBvyT2q_Cs',
  alt: 'Close up photo of footprints in sand',
  start_time: Time.now.to_f * 1000 - (4 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/171/2048/1536.jpg?hmac=16eVtfmqTAEcr8VwTREQX4kV8dzZKcGWI5ouMlhRBuk',
  alt: 'Raindrops on a window with a blurred cityscape in the background',
  start_time: Time.now.to_f * 1000 - (3 * 60 * 1000)
)
Image.create(
  url:
    'https://i.picsum.photos/id/182/2896/1944.jpg?hmac=lzw4TC7qF2R3BEJu05d0M6rdglY57ugjugCP6XoiMbQ',
  alt: 'Curving paved highway with two windmills under a blue sky',
  start_time: Time.now.to_f * 1000 - (2 * 60 * 1000)
)
puts '...Done seeding Images!'

puts 'Seeding users...'
u1 = User.create(name: 'Joe Shmo', session_id: '000.000.0.0')
u2 = User.create(name: 'John Doe', session_id: '000.000.0.1')
u3 = User.create(name: 'Jane Doe', session_id: '000.000.0.2')
u4 = User.create(name: 'Anna Banana', session_id: '000.000.0.3')
u5 = User.create(name: 'Lurker', session_id: '000.000.0.4')
u6 = User.create(name: 'Foofoo', session_id: 'foobarmydude')
puts '...Done seeding users'

puts 'Seeding Words...'
# w1 = Word.create(text: 'fire', image: img, submitter: u1)
w2 = Word.create(text: 'lava', image: img, submitter: u2)
w3 = Word.create(text: 'painting', image: img, submitter: u3)
w4 = Word.create(text: 'squiggly', image: img, submitter: u4)
puts '...Done seeding Words!'

puts 'Seeding Guesses...'
# g1 = Guess.create(image: img, guesser: u1, guessed_word: w2)
g2 = Guess.create(image: img, guesser: u2, guessed_word: w2)
g3 = Guess.create(image: img, guesser: u3, guessed_word: w3)
g4 = Guess.create(image: img, guesser: u4, guessed_word: w3)
g5 = Guess.create(image: img, guesser: u5, guessed_word: w3)
puts '...Done seeding Guesses!'

puts '🌱 ..... All Done Seeding! 🌱'
