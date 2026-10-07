import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RebbiOS());
}

// ============================================================
// REBBI OS
// ============================================================

class RebbiOS extends StatelessWidget {
  const RebbiOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rebbi OS',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0E0B10),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const BootPage(),
    );
  }
}

// ============================================================
// BOOT SCREEN
// ============================================================

class BootPage extends StatefulWidget {
  const BootPage({super.key});

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      setState(() => opacity = 1);
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09080A),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 1),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('❤️', style: TextStyle(fontSize: 78)),
              SizedBox(height: 25),
              Text(
                'REBBI OS',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Boyfriend Management System',
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 170,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Starting boyfriend services... 🤓',
                style: TextStyle(fontSize: 12, color: Colors.white38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool italian = false;

  String tr(String de, String it) {
    return italian ? it : de;
  }

  // ============================================================
  // STANDARD POPUP
  // ============================================================

  void popup(String emoji, String title, String text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF211820),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 52)),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.5,
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.pinkAccent),
            onPressed: () => Navigator.pop(context),
            child: Text(tr('Okay 😂', 'Va bene 😂')),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // APPRECIATION
  // ============================================================

  void appreciation() {
    final de = [
      'Du siehst heute verdammt schön aus. ❤️',
      'Ja Rebbi, Yasin findet dich immer noch süß. Leider. 😂',
      'Eilmeldung: Du bist immer noch seine Lieblingsitalienerin. 🇮🇹❤️',
      'Dein Lächeln ist unfair süß.',
      'Du warst gestern wunderschön, bist es heute und die Prognose für morgen sieht ebenfalls sehr gut aus. 😌',
      'Du bist definitiv nicht selbstverständlich für mich. ❤️',
      'Systemanalyse abgeschlossen: Rebbi ist schon wieder viel zu hübsch. 🙄❤️',
      'Warnung: Erhöhte Vermissungsgefahr bei längerer Entfernung zu Rebbi. 🚨❤️',
    ];

    final it = [
      'Oggi sei davvero bellissima. ❤️',
      'Sì Rebbi, Yasin pensa ancora che tu sia dolcissima. Purtroppo. 😂',
      'Ultim\'ora: sei ancora la sua italiana preferita. 🇮🇹❤️',
      'Il tuo sorriso è ingiustamente dolce.',
      'Eri bellissima ieri, lo sei oggi e le previsioni per domani sono altrettanto buone. 😌',
      'Non ti do assolutamente per scontata. ❤️',
      'Analisi completata: Rebbi è di nuovo troppo bella. 🙄❤️',
      'Attenzione: rischio elevato di sentire la mancanza di Rebbi quando è troppo lontana. 🚨❤️',
    ];

    final index = Random().nextInt(de.length);

    popup(
      '❤️',
      tr('Tägliche Rebbi-Wertschätzung', 'Apprezzamento quotidiano di Rebbi'),
      italian ? it[index] : de[index],
    );
  }

  // ============================================================
  // ICE CREAM
  // ============================================================

  void iceCream() {
    popup(
      '🍦',
      tr('EIS-PROTOKOLL', 'PROTOCOLLO GELATO'),
      tr(
        'Rebbi hat Eis erwähnt.\n\n'
            'Reaktion des Freundes erforderlich.\n\n'
            'Yasin wird losgeschickt...\n\n'
            'Geschätzte Lieferzeit:\n'
            'verdächtig schnell. 😂',
        'Rebbi ha menzionato il gelato.\n\n'
            'È richiesto l\'intervento del fidanzato.\n\n'
            'Yasin è stato inviato...\n\n'
            'Tempo di consegna stimato:\n'
            'sospettosamente veloce. 😂',
      ),
    );
  }

  // ============================================================
  // INSTAGRAM
  // ============================================================

  void instagram() {
    popup(
      '📸',
      tr('Instagram-Scanner', 'Scanner Instagram'),
      tr(
        'Neues Rebbi-Foto erkannt.\n\n'
            '❌ Nur Like\n'
            '❌ „schön“\n'
            '❌ keine Reaktion\n\n'
            '✅ MADONNA MIA 😍❤️\n\n'
            'Mindestanforderung an Freund-Komplimente erfüllt.',
        'Nuova foto di Rebbi rilevata.\n\n'
            '❌ Solo like\n'
            '❌ „bella“\n'
            '❌ nessuna reazione\n\n'
            '✅ MADONNA MIA 😍❤️\n\n'
            'Requisito minimo di complimenti del fidanzato soddisfatto.',
      ),
    );
  }

  // ============================================================
  // OTHER BOYS
  // ============================================================

  void otherBoys() {
    popup(
      '👀',
      tr('Andere-Jungs-Abteilung', 'Dipartimento altri ragazzi'),
      tr(
        'Ein männlicher Mensch hat Rebbis Foto geliked.\n\n'
            'Empfohlene Aktion:\n\n'
            '❌ Blockieren\n'
            '❌ Rebbi verhören\n'
            '❌ Dritten Weltkrieg starten\n\n'
            '✅ Rebbi vertrauen ❤️\n\n'
            'Rebbi darf mit Menschen reden.',
        'Un essere umano di sesso maschile ha messo like alla foto di Rebbi.\n\n'
            'Azione consigliata:\n\n'
            '❌ Bloccarlo\n'
            '❌ Interrogare Rebbi\n'
            '❌ Iniziare la terza guerra mondiale\n\n'
            '✅ Fidarsi di Rebbi ❤️\n\n'
            'Rebbi può parlare con altri esseri umani.',
      ),
    );
  }

  // ============================================================
  // ITALY
  // ============================================================

  void italy() {
    popup(
      '🇮🇹',
      tr('ITALIEN-KRISENZENTRALE', 'CENTRO CRISI ITALIA'),
      tr(
        'Rebbi versucht, nach Italien zurückzukehren.\n\n'
            'Risikostufe: EXTREM 🚨\n\n'
            'Italien darf dich manchmal haben...\n\n'
            'aber Deutschland wird dich vermissen.\n\n'
            'Vor allem ein Idiot. ❤️',
        'Rebbi sta cercando di tornare in Italia.\n\n'
            'Livello di rischio: ESTREMO 🚨\n\n'
            'L\'Italia può averti ogni tanto...\n\n'
            'ma alla Germania mancherai.\n\n'
            'Soprattutto a un idiota. ❤️',
      ),
    );
  }

  // ============================================================
  // OVERTHINKING
  // ============================================================

  void overthinking() {
    popup(
      '🤓',
      tr('Rebbi-Gedankenanalysator', 'Analizzatore dei pensieri di Rebbi'),
      tr(
        'Rebbi-Gehirn wird gescannt...\n\n'
            '████████████ 100%\n\n'
            '87 % unnötiges Overthinking erkannt.\n\n'
            'Empfohlene Behandlung:\n'
            'Mit deinem Freund reden. ❤️',
        'Scansione del cervello di Rebbi...\n\n'
            '████████████ 100%\n\n'
            'Rilevato 87% di overthinking inutile.\n\n'
            'Trattamento consigliato:\n'
            'Parlare con il tuo fidanzato. ❤️',
      ),
    );
  }

  // ============================================================
  // MARIOLINO
  // ============================================================

  void mariolino() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF211820),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: Text(
          tr('🐶 Mariolino-Abteilung', '🐶 Dipartimento Mariolino'),
          textAlign: TextAlign.center,
        ),
        content: Text(
          tr('Wähle deinen Favoriten.', 'Scegli il tuo preferito.'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);

              Future.delayed(const Duration(milliseconds: 150), () {
                if (!mounted) return;

                popup(
                  '🐶',
                  tr('Richtig.', 'Corretto.'),
                  tr(
                    'Natürlich Mariolino.\n\n'
                        'Yasin hat den zweiten Platz akzeptiert. 😔',
                    'Ovviamente Mariolino.\n\n'
                        'Yasin ha accettato il secondo posto. 😔',
                  ),
                );
              });
            },
            child: const Text('Mariolino 🐶'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);

              Future.delayed(const Duration(milliseconds: 150), () {
                if (!mounted) return;

                popup(
                  '🚨',
                  tr('Verdächtige Antwort', 'Risposta sospetta'),
                  tr(
                    'Das System glaubt, dass Rebbi lügt.\n\n'
                        'Richtige Antwort: Mariolino 🐶\n\n'
                        'Aber Yasin weiß die Mühe zu schätzen. 😂❤️',
                    'Il sistema pensa che Rebbi stia mentendo.\n\n'
                        'Risposta corretta: Mariolino 🐶\n\n'
                        'Ma Yasin apprezza lo sforzo. 😂❤️',
                  ),
                );
              });
            },
            child: const Text('Yasin ❤️'),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // OTHER PAGES
  // ============================================================

  void beerSystem() {
    showDialog(
      context: context,
      builder: (_) => BeerDialog(italian: italian),
    );
  }

  void communication() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CommunicationDialog(
          italian: italian,
          onResult: (text) {
            Navigator.pop(dialogContext);

            Future.delayed(const Duration(milliseconds: 150), () {
              if (!mounted) return;

              popup(
                '📡',
                tr('Kommunikationssystem', 'Sistema di comunicazione'),
                text,
              );
            });
          },
        );
      },
    );
  }

  void seriousPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SeriousPage(italian: italian)),
    );
  }

  void gallery() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => GalleryPage(italian: italian)),
    );
  }

  // ============================================================
  // EASTER EGG
  // ============================================================

  void secretMode() {
    popup(
      '🔓',
      tr('GEHEIMER MODUS FREIGESCHALTET', 'MODALITÀ SEGRETA SBLOCCATA'),
      tr(
        'Du hast das geheime Rebbi-OS-Menü gefunden.\n\n'
            'BELOHNUNG:\n\n'
            '💋 1 Gutschein für einen Kuss von Yasin\n\n'
            'Nicht übertragbar.\n'
            'Keine Barauszahlung möglich.\n\n'
            'Unbegrenzt einlösbar, wenn Yasin in der Nähe ist. 😂❤️',
        'Hai trovato il menu segreto di Rebbi OS.\n\n'
            'PREMIO:\n\n'
            '💋 1 buono per un bacio da Yasin\n\n'
            'Non trasferibile.\n'
            'Nessun rimborso in contanti.\n\n'
            'Utilizzabile senza limiti quando Yasin è nelle vicinanze. 😂❤️',
      ),
    );
  }

  // ============================================================
  // HOME UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3A122B), Color(0xFF170E16), Color(0xFF09090B)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 25, 22, 40),
            children: [
              Row(
                children: [
                  GestureDetector(
                    onLongPress: secretMode,
                    child: const Text('🇮🇹', style: TextStyle(fontSize: 43)),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ciao Rebbi ❤️',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'REBBI OS',
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 2,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // LANGUAGE SWITCH
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .06),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: LanguageButton(
                        text: '🇩🇪  DE',
                        selected: !italian,
                        onTap: () {
                          setState(() {
                            italian = false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: LanguageButton(
                        text: '🇮🇹  IT',
                        selected: italian,
                        onTap: () {
                          setState(() {
                            italian = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // SYSTEM STATUS
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pinkAccent.withValues(alpha: .30),
                      Colors.purple.withValues(alpha: .15),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      tr('SYSTEMSTATUS', 'STATO DEL SISTEMA'),
                      style: const TextStyle(
                        letterSpacing: 2,
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '❤️ 100%',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      tr(
                        'Rebbi-Wertschätzungssystem läuft',
                        'Sistema di apprezzamento Rebbi operativo',
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==================================================
              // REBBI 6 - ALWAYS ON HOME SCREEN
              // ==================================================
              GestureDetector(
                onTap: gallery,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .06),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.pinkAccent.withValues(alpha: .20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.asset(
                          'Assets/images/rebbi_6.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr('REBBI DES TAGES ❤️', 'REBBI DEL GIORNO ❤️'),
                              style: const TextStyle(
                                fontSize: 11,
                                letterSpacing: 2,
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              tr(
                                'Systembewertung: 11/10',
                                'Valutazione del sistema: 11/10',
                              ),
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              tr(
                                'Keine weiteren Maßnahmen erforderlich. 😌',
                                'Nessun intervento necessario. 😌',
                              ),
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                tr('KONTROLLZENTRALE', 'CENTRO DI CONTROLLO'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 14),

              AppTile(
                emoji: '❤️',
                title: tr(
                  'Tägliche Rebbi-Wertschätzung',
                  'Apprezzamento quotidiano di Rebbi',
                ),
                subtitle: tr(
                  'Notfall-Komplimentgenerator',
                  'Generatore di complimenti d\'emergenza',
                ),
                onTap: appreciation,
              ),

              AppTile(
                emoji: '🖼️',
                title: tr('Rebbi-Archiv', 'Archivio Rebbi'),
                subtitle: tr(
                  'Hochsicheres Bildmaterial',
                  'Materiale fotografico altamente riservato',
                ),
                onTap: gallery,
              ),

              AppTile(
                emoji: '🍦',
                title: tr('Eis-Protokoll', 'Protocollo gelato'),
                subtitle: tr(
                  'Freund-Einsatzsystem',
                  'Sistema di intervento del fidanzato',
                ),
                onTap: iceCream,
              ),

              AppTile(
                emoji: '📸',
                title: tr('Instagram-Scanner', 'Scanner Instagram'),
                subtitle: tr(
                  'Prüft die Qualität der Freund-Reaktion',
                  'Controlla la qualità della reazione del fidanzato',
                ),
                onTap: instagram,
              ),

              AppTile(
                emoji: '👀',
                title: tr(
                  'Andere-Jungs-Abteilung',
                  'Dipartimento altri ragazzi',
                ),
                subtitle: tr(
                  'Deutsche Vertrauenstechnologie',
                  'Tecnologia tedesca della fiducia',
                ),
                onTap: otherBoys,
              ),

              AppTile(
                emoji: '🍺',
                title: tr(
                  'Bier-Genehmigungssystem',
                  'Sistema di autorizzazione della birra',
                ),
                subtitle: tr(
                  'Unter italienischer Leitung',
                  'Sotto gestione italiana',
                ),
                onTap: beerSystem,
              ),

              AppTile(
                emoji: '📡',
                title: tr(
                  'Kommunikationsabteilung',
                  'Dipartimento comunicazione',
                ),
                subtitle: tr(
                  'Wähle den richtigen Kommunikationsweg',
                  'Scegli il canale di comunicazione corretto',
                ),
                onTap: communication,
              ),

              AppTile(
                emoji: '🇮🇹',
                title: tr('Italien-Krisenzentrale', 'Centro crisi Italia'),
                subtitle: tr(
                  'Aktuelle Risikostufe: EXTREM',
                  'Livello di rischio attuale: ESTREMO',
                ),
                onTap: italy,
              ),

              AppTile(
                emoji: '🐶',
                title: tr('Mariolino-Abteilung', 'Dipartimento Mariolino'),
                subtitle: tr(
                  'Yasin ist aktuell auf Platz 2',
                  'Yasin è attualmente al secondo posto',
                ),
                onTap: mariolino,
              ),

              AppTile(
                emoji: '🤓',
                title: tr(
                  'Rebbi-Gedankenanalysator',
                  'Analizzatore dei pensieri di Rebbi',
                ),
                subtitle: tr(
                  'Erkennt unnötiges Overthinking',
                  'Rileva l\'overthinking inutile',
                ),
                onTap: overthinking,
              ),

              AppTile(
                emoji: '❤️',
                title: tr(
                  'Was Yasin wirklich denkt',
                  'Quello che Yasin pensa davvero',
                ),
                subtitle: tr('Hier keine Witze.', 'Qui niente scherzi.'),
                special: true,
                onTap: seriousPage,
              ),

              const SizedBox(height: 30),

              // FOOTER
              Text(
                tr(
                  'REBBI OS 6.7\n'
                      'Bekannte Bugs: Overthinking • Italien • Yasin\n'
                      'Entwickler: Yasin ❤️',
                  'REBBI OS 1.5\n'
                      'Bug noti: Overthinking • Italia • Yasin\n'
                      'Sviluppatore: Yasin ❤️',
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.6,
                  color: Colors.white30,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// LANGUAGE BUTTON
// ============================================================

class LanguageButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? Colors.pinkAccent.withValues(alpha: .30)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Colors.white : Colors.white54,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MENU TILE
// ============================================================

class AppTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool special;

  const AppTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.special = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Material(
        color: special
            ? Colors.pinkAccent.withValues(alpha: .13)
            : Colors.white.withValues(alpha: .055),
        borderRadius: BorderRadius.circular(21),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(21),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              children: [
                Container(
                  width: 51,
                  height: 51,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .07),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(emoji, style: const TextStyle(fontSize: 26)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.white30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// BEER SYSTEM
// ============================================================

class BeerDialog extends StatefulWidget {
  final bool italian;

  const BeerDialog({super.key, required this.italian});

  @override
  State<BeerDialog> createState() => _BeerDialogState();
}

class _BeerDialogState extends State<BeerDialog> {
  int beers = 0;
  String? message;

  String tr(String de, String it) {
    return widget.italian ? it : de;
  }

  void requestBeer() {
    setState(() {
      beers++;

      if (beers == 1) {
        message = tr(
          'GENEHMIGT 🍺\n\nViel Spaß, Yasin.',
          'APPROVATA 🍺\n\nDivertiti, Yasin.',
        );
      } else if (beers == 2) {
        message = tr(
          'Hmm... genehmigt. 🤨\n\n'
              'Rebbi beobachtet die Situation.',
          'Hmm... approvata. 🤨\n\n'
              'Rebbi sta osservando la situazione.',
        );
      } else if (beers == 3) {
        message = tr(
          '⚠️ WARNUNG\n\n'
              'Rebbi beobachtet dich jetzt sehr genau. 👀',
          '⚠️ ATTENZIONE\n\n'
              'Rebbi adesso ti sta osservando molto attentamente. 👀',
        );
      } else {
        message = tr(
          '🚨 ANFRAGE ABGELEHNT 🚨\n\n'
              'Die italienische Geschäftsführung hat eingegriffen.\n\n'
              'Trink Wasser, Deutscher. 🇮🇹😂',
          '🚨 RICHIESTA RIFIUTATA 🚨\n\n'
              'La direzione italiana è intervenuta.\n\n'
              'Bevi acqua, tedesco. 🇮🇹😂',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF211820),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      title: Text(
        tr(
          '🍺 Bier-Genehmigungssystem',
          '🍺 Sistema di autorizzazione della birra',
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr('Bier: $beers', 'Birre: $beers'),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (message != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .06),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.5),
              ),
            ),
          const SizedBox(height: 20),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.pinkAccent),
            onPressed: requestBeer,
            child: Text(tr('🍺 Bier beantragen', '🍺 Richiedi una birra')),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(tr('Schließen', 'Chiudi')),
        ),
      ],
    );
  }
}

// ============================================================
// COMMUNICATION
// NIKY REMOVED
// ============================================================

class CommunicationDialog extends StatelessWidget {
  final bool italian;
  final void Function(String) onResult;

  const CommunicationDialog({
    super.key,
    required this.italian,
    required this.onResult,
  });

  String tr(String de, String it) {
    return italian ? it : de;
  }

  Widget option(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: OutlinedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(text, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF211820),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      title: Text(
        tr(
          '📡 Etwas beschäftigt Rebbi...',
          '📡 C\'è qualcosa che preoccupa Rebbi...',
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          option(
            tr('Giusy erzählen', 'Dirlo a Giusy'),
            () => onResult(
              tr(
                'Giusy hat schon genug Arbeit. 😂\n\n'
                    'Bitte einen direkteren Kommunikationsweg wählen.',
                'Giusy ha già abbastanza lavoro. 😂\n\n'
                    'Per favore scegli un canale di comunicazione più diretto.',
              ),
            ),
          ),
          option(
            tr(
              'Mich von etwas Absurdem überzeugen 🤓',
              'Convincermi di qualcosa di assurdo 🤓',
            ),
            () => onResult(
              tr(
                'Klassische Rebbi erkannt.\n\n'
                    'Overthinking-Modul aktiviert.',
                'Rilevata Rebbi classica.\n\n'
                    'Modulo overthinking attivato.',
              ),
            ),
          ),
          option(
            tr('Yasin erzählen ❤️', 'Dirlo a Yasin ❤️'),
            () => onResult(
              tr(
                'Direktverbindung hergestellt. ❤️\n\n'
                    'Dieser Kommunikationsweg ist immer verfügbar.',
                'Connessione diretta stabilita. ❤️\n\n'
                    'Questo canale di comunicazione è sempre disponibile.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SERIOUS PAGE
// YASIN PHOTO
// ============================================================

class SeriousPage extends StatelessWidget {
  final bool italian;

  const SeriousPage({super.key, required this.italian});

  String tr(String de, String it) {
    return italian ? it : de;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100C10),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 35),
                child: Column(
                  children: [
                    const SizedBox(height: 15),

                    // YASIN IMAGE
                    Container(
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.pinkAccent.withValues(alpha: .55),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withValues(alpha: .18),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'Assets/images/yasin_1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      tr(
                        'Okay, jetzt ohne Witze.',
                        'Okay, adesso niente scherzi.',
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      tr(
                        'Du bist für mich nicht selbstverständlich.\n\n'
                            'Ich sage dir vielleicht nicht immer alles, was ich denke.\n\n'
                            'Aber das bedeutet nicht, dass ich es nicht denke.\n\n'
                            'Ich bin wirklich froh, dass du in meinem Leben bist.\n\n'
                            'Und ja...\n'
                            'ich sollte dir das öfter sagen. ❤️',
                        'Non ti do per scontata.\n\n'
                            'Forse non ti dico sempre tutto quello che penso.\n\n'
                            'Ma questo non significa che non lo pensi.\n\n'
                            'Sono davvero felice che tu faccia parte della mia vita.\n\n'
                            'E sì...\n'
                            'dovrei dirtelo più spesso. ❤️',
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 19,
                        height: 1.65,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      '— Yasin ❤️',
                      style: TextStyle(color: Colors.white38, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// REBBI GALLERY
// NO YASIN
// NO SUBTITLES
// ============================================================

class GalleryPage extends StatelessWidget {
  final bool italian;

  const GalleryPage({super.key, required this.italian});

  String tr(String de, String it) {
    return italian ? it : de;
  }

  static const List<String> images = [
    'Assets/images/rebbi_6.jpg',
    'Assets/images/rebbi_1.jpg',
    'Assets/images/rebbi_3.jpg',
    'Assets/images/rebbi_4.jpg',
    'Assets/images/rebbi_5.jpg',
    'Assets/images/rebbi_7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF170E16),
        title: Text(tr('📸 Rebbi-Archiv', '📸 Archivio Rebbi')),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3A122B), Color(0xFF170E16), Color(0xFF09090B)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              tr('STRENG GEHEIM 🤫', 'TOP SECRET 🤫'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: 3,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              tr(
                'Offizielles Rebbi-OS Bildarchiv',
                'Archivio fotografico ufficiale di Rebbi OS',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),

            const SizedBox(height: 8),

            Text(
              tr(
                'Nur autorisiertes Personal ❤️',
                'Solo personale autorizzato ❤️',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white54),
            ),

            const SizedBox(height: 28),

            for (final image in images) GalleryCard(image: image),

            const SizedBox(height: 15),

            Text(
              tr('REBBI OS • PHOTO ARCHIVE ❤️', 'REBBI OS • ARCHIVIO FOTO ❤️'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white30,
                fontSize: 10,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// GALLERY CARD
// JUST THE IMAGE
// ============================================================

class GalleryCard extends StatelessWidget {
  final String image;

  const GalleryCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Material(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FullScreenImage(image: image)),
            );
          },
          child: Image.asset(image, width: double.infinity, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// ============================================================
// FULLSCREEN IMAGE
// ============================================================

class FullScreenImage extends StatelessWidget {
  final String image;

  const FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Center(child: Image.asset(image, fit: BoxFit.contain)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .60),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
