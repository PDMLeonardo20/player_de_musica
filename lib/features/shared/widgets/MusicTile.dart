import 'package:flutter/material.dart';
import 'package:flutter_music_player/utils/extensions/SongModelExtension.dart';
import 'package:on_audio_query/on_audio_query.dart';

//cria a lista de musica na tela inicial

class MusicTile extends StatelessWidget {
  final SongModel songModel;

  const MusicTile({
    required this.songModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        songModel.displayNameWOExt, //mostra o nome da musica sem a extensão
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(songModel.additionalSongInfo),
      trailing: const Icon(Icons.more_horiz),
      // mostra a capa da musica
      leading: QueryArtworkWidget(
        id: songModel.id,
        type: ArtworkType.AUDIO,
        nullArtworkWidget: CircleAvatar(
            child: const Icon(
                Icons.music_note)), // caso nao tenha capa, mostra um icone
      ),
    );
  }
}
