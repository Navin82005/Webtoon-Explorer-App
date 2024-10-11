import 'package:get/get.dart';
import 'package:webtoon_explorer/model/manga.dart';

class HomePageController extends GetxController {
  var manga = <Manga>[].obs;
  var papular = <Manga>[].obs;
  var genres = <String>[].obs;
  var isLoading = false.obs;

  void fetchData() async {
    isLoading.value = true;

    // Make API call
    await Future.delayed(const Duration(seconds: 5));
    manga.value = [
      Manga(
        title: "Hello Baby",
        creator: "Enjelicious",
        genre: "Romance",
        category: "popular",
        description:
            "Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates. They end up hooking up, but Gwen runs away, afraid of the outcome. Fate brings them 2 years later, and they end up in a legal fight when Arthur finds out about his and Gwen's child. Read Hello Baby to learn whether they can solve their differences.",
        rating: "4.5",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123040-750x375.webp",
      ),
      Manga(
        title: "The Alpha King's Claim",
        creator: "JMFelic",
        category: 'popular',
        genre: "Romance",
        description:
            "Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates. They end up hooking up, but Gwen runs away, afraid of the outcome. Fate brings them 2 years later, and they end up in a legal fight when Arthur finds out about his and Gwen's child. Read Hello Baby to learn whether they can solve their differences.",
        rating: "4.5",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123400-750x375.webp",
      ),
      Manga(
          title: "Leviathan",
          category: "supernatural",
          creator: "Gyeong-tak LEE, Mi-young NOH",
          genre: "Sci-Fi, Horror, Action",
          description:
              "The protagonist, Bota, and his family live on a small boat because the water has risen and captured the dry lands. So, they search for food and more from the underwater cities. Leviathan follows the survival journey of the siblings Bota and Rita Ma following the murder of their father at the hands of a sea monster. Following a near-lethal encounter with a monster, Bota and Rita are taken in by Kana, an acquaintance of Teon Ma, their late father. Eventually, a tragic twist in the narrative, Bota, Rita, and Kana find themselves battling for the survival of humanity.",
          rating: "4.5",
          dateOfRelease: "2018-2022",
          image:
              "https://animemangatoon.com/wp-content/uploads/2024/06/pjimage-12-4-e1720973001888-750x375.jpg"),
      Manga(
        title: "Tower of God",
        creator: "SIU",
        category: "supernatural",
        genre: "Action, Fantasy",
        description:
            "The Tower of God revolves around Twenty-Fifth Baam, who spends most of his early life stuck beneath the titular tower. While looking for his friend Rachel, he climbs the mysterious tower. What he will discover in his quest to find his friend is also beyond anything he could have imagined. Moreover, the more he climbs, the more difficult it gets, as each floor offers him a new obstacle that he has to overcome to keep climbing. Baam needs to succeed in all these challenges to reach the peak of the Tower eventually.",
        rating: "4.6",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/06/season-1-1.jpg",
      ),
      Manga(
        title: "Leveling Up with the Gods",
        creator: "Ohyeon, B.Ain",
        category: "supernatural",
        genre: "Action, Fantasy",
        description:
            "Leveling Up with the Gods is undoubtedly one of the best supernatural manhwa. It centres on Kim Yuwon, who, after losing the battle against the Outer Gods, is offered another opportunity and sent back into the past. Now, back to the time before the war, Yuwon has only one objective - to eventually climb the Tower and become the strongest to avert the potential destruction. If you liked Tower of God, you must read Leveling Up With the Gods.",
        rating: "4.6",
        dateOfRelease: "2021-?",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/05/594f4d74-e0a2-4179-b8f5-141f140345d0-e1721128805577-1024x368.jpg",
      ),
      Manga(
        title: "Bitten Contract",
        creator: "Sungeun",
        category: "popular",
        genre: "romance",
        description:
            "Do you believe vampires exist? What would your first reaction be if you crossed paths with a vampire? Would you be delighted, terrified, or unsure of how to act? Well, Chae-i certainly had an unusual reaction than the others. Chae-i is an actress who has been in the entertainment industry ever since she can remember. However, she is been having a hard time fitting in with other actors due to the extremely painful headaches she started having a little while ago. As a consequence of this, her professional life started deteriorating.|Everyone started thinking of her as some stuck-up actress. However, one time, she gets bitten by Ijun, a top actor who is a vampire. Surprisingly, her headache vanishes for a week. Hence, she asks him to continue biting her to keep everything going smoothly. To her surprise, Ijun asks for a contractual relationship in return. Read the popular webtoon, Bitten Contract, to find out his motive behind asking Chae-i for a relationship.",
        rating: "4.8",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123842-750x375.webp",
      ),
      Manga(
        title: "Tricked into Becoming the Heroine's Stepmother",
        creator: "Hariheen",
        category: "",
        genre: "Fantasy",
        description:
            "How would you feel if one day you woke up in the novel you wrote just after dying in the real world? Would you feel ecstatic to have a chance to live again? Or would you feel scared because of the uncertain possibilities and the danger lurking? Daisy is a woman with a kind yet strong personality. Following her death in the real world, she wakes up in the novel she wrote with her nine other friends just for fun. Unfortunately, her living conditions do not change much. However, one random day, she is arrested by the duke’s soldier for helping her friend out.",
        rating: "4.1",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-125252-750x375.webp",
      ),
      Manga(
        title: "The Guy Upstairs",
        creator: "Hanza Art",
        category: "",
        genre: "Thriller",
        description:
            "The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?",
        rating: "4.0",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-05-28-192655-e1723318535608-750x375.png",
      ),
      Manga(
        title: "The Runaway",
        creator: "Domi,Nokdu",
        category: "",
        genre: "Romance",
        description:
            "Paris is known as the city of love by the whole world. Would you consider going there freshly after a breakup? Jian is a beautiful young woman who works in the fashion industry. One day, she discovers that her new handsome boss is the person she had been hooked up with in France. She dismisses it, thinking that he probably does not remember her since it has been so long. However, she is proved wrong. On top of it all, he is extremely rude to her in the office but too nice when alone. Also, the new gay couple that shifted next door is quite interesting. Scroll the popular webtoon The Runaway to know what happens when Jian’s ex tries patching up things with her and why the handsome neighbor is too kind to her.",
        rating: "4.2",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-08-11-011235-750x375.png",
      ),
      Manga(
        title: "Your Smile Is A Trap",
        creator: "Aengo",
        category: "popular",
        genre: "Romance",
        description:
            "Do you believe that people judge others based on their outer appearance? Have you ever been judged based on your looks? Kiyo is an ex-idol trainee who wants to live like a normal teenager. In this attempt, he starts living with his grandmother and enrolls in a new school. He even starts wearing ugly-looking glasses to hide his exceptional looks. There, he meets Lily, another victim of the same thing. People fear her and her father just because of their scary features, even though they are nice. However, Kiyu makes the same mistakes as others and judges Lily just like everyone else. Gradually, Kiyu realizes his mistake and the fact that Lily is really nice and kind. Read Your Smile Is A Trap to learn about their blossoming love and the obstacles they face.",
        rating: "4.7",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-132459-750x375.webp",
      ),
      Manga(
        title: "There Must Be Happy Endings",
        creator: "Jaerim, Bulsa, Flada",
        category: "",
        genre: "Romance",
        description:
            "If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events, Seonjae dies in front of her. However, fate gives her a second chance, and she vows to save Seonjae this time. Read There Must Be Happy Endings to find out whether or not Yeonu was able to save Seonjae and why Seonjae seems to be hiding several secrets.",
        rating: "4.7",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133040-750x375.webp",
      ),
      Manga(
        title: "Seasons of Blossom",
        creator: "HONGDUCK, NEMONE",
        category: "",
        genre: "Romance",
        description:
            "The popular webtoon series Seasons of Blossom is a compilation of several individual stories that are all connected. It contains all four seasons: spring, summer, fall, and winter. Each season contains a different story and a different theme with different endings. It focuses majorly on school bullying and how much it can affect someone’s whole life. Despite it being based on high school students, the story has several serious events and a storyline with many variations. Check out this webtoon to learn about each story and their interlinked connections.",
        rating: "4.2",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133857-750x375.webp",
      ),
      Manga(
        title: "Romance 101",
        creator: "Namsoo",
        category: "popular",
        genre: "Romance",
        description:
            "Are you an organized person who keeps track of every detail, disregarding how insignificant it may be, or are you a messy person who goes with the flow? Bareum is a very organized person who even maintains a diary detailing all her events and commitments. She has always had great marks and a clear record of what she wants to do in the future. However, one thing that she has not had any luck with is making a boyfriend. She decides to do things a little differently to achieve this goal and hence joins a programming club despite her planner being full. Fate has different plans in store for her. Read the popular webtoon Romance 101 to find out whether or not she was able to achieve this goal.",
        rating: "4.2",
        image:
            "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-134227-750x375.webp",
      ),
    ];

    List<Manga> papular_tmp = [];
    List<String> genre_tmp = [];

    for (int i = 0; i < manga.length; i++) {
      if (manga[i].category.toLowerCase().trim() == "popular") {
        papular_tmp += [manga[i]];
      }
      if (!genre_tmp.contains(manga[i].genre.toLowerCase().trim())) {
        genre_tmp += [manga[i].genre.toLowerCase().trim()];
      }
    }

    papular.value = papular_tmp;
    genres.value = genre_tmp;

    isLoading.value = false;
  }
}
