
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;
  final String imageUrl;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.imageUrl
  });
}

const listSongs = [
  Song(
    id: '0',
    title: 'Easy on me',
    artist: 'Adele',
    album: '30',
    duration: '3:44',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b27350dba34377a595e35f81b0e4'
  ),
  Song(
    id: '1',
    title: 'Lover',
    artist: 'Taylor Swift',
    album: 'Lover',
    duration: '3:41',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e787cffec20aa2a396a61647'
  ),
  Song(
    id: '2',
    title: 'Far Away',
    artist: 'Mila Coolness',
    album: 'Silent River',
    duration: '2:39',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b273f70b7969b6f28cd018dc2b9f'
  ),
  Song(
    id: '3',
    title: 'Call You Soon',
    artist: 'Louk, Glimlip',
    album: 'Can We Talk',
    duration: '2:35',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b2730fc90e25f5b8488ffe3947c8'
  ),
  Song(
    id: '4',
    title: 'Winter Sun',
    artist: 'Bcalm, Banks',
    album: 'Feelings',
    duration: '2:15',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b2733f6b821335fde5ee3999f4e9'
  ),
  Song(
    id: '5',
    title: 'Hope',
    artist: 'No Spirit',
    album: 'Memories We Made',
    duration: '1:57',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b273f21dc9b797e88cdcff9370a1'
  ),
  Song(
    id: '6',
    title: 'A Better Place',
    artist: 'Project AER, cxit.',
    album: 'Growth Patterns',
    duration: '2:00',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b27389b9dcc505ee5e0a1e742729'
  ),
];
