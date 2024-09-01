import 'package:breaktime/screens/view_article_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../models/article.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int _selectedIndex = 3;

  final List<Article> articles = [
    Article(
      title: 'Why take a break?',
      description: 'In today\'s fast-paced world, the pressure to constantly perform and be productive can lead to burnout, stress, and decreased...',
      content: '''In today's fast-paced world, the pressure to constantly perform and be productive can lead to burnout, stress, and decreased overall well-being. Taking regular breaks, however, is crucial for maintaining mental and physical health, improving productivity, and fostering creativity.

One of the primary benefits of taking a break is the positive impact on mental health. Continuous work without rest can lead to stress, anxiety, and mental fatigue, diminishing the quality of one's work and personal life. Short breaks allow the mind to reset, reducing stress levels and improving focus. This mental recharge is essential for maintaining long-term productivity and avoiding burnout.

Physical health also benefits from regular breaks. Sitting or standing in one position for extended periods can lead to physical discomfort, muscle strain, and even chronic health issues like back pain or repetitive strain injuries. Brief periods of movement or relaxation can prevent these issues by promoting better circulation, improving posture, and reducing the risk of long-term physical problems.

Moreover, taking breaks can enhance creativity and problem-solving abilities. When the brain is allowed to rest, it often processes information subconsciously, leading to new insights and creative solutions. Stepping away from a task allows for a fresh perspective, which can be invaluable in finding innovative approaches to challenges.

In summary, taking breaks is not a sign of laziness or inefficiency; rather, it is a crucial aspect of maintaining overall well-being. By allowing time for mental and physical recovery, breaks help sustain long-term productivity, prevent burnout, and foster creativity. Embracing the importance of rest can lead to better work, improved health, and a more balanced life.''',
      image: 'assets/images/article1.jpg',
    ),
    Article(
      title: 'Taking short breaks',
      description: 'Exploring how breaks help reduce stress, prevent burnout, and improve overall mental well-being.',
      content: '''In our busy lives, it's easy to forget the value of taking a short break. We often think that powering through work without stopping is the best way to get things done. But taking a few minutes to step away can actually help us more than we realize. Short breaks give us a chance to clear our minds, relax, and come back to our tasks with more focus and energy.

When we work without breaks, our minds can get tired, and it's harder to stay focused. Even just a five-minute break can make a big difference. It gives our brain a chance to rest and reset, so when we return to work, we're more alert and ready to tackle challenges. This helps us avoid the mental fatigue that can slow us down.

Short breaks are also important for our emotional well-being. If we keep pushing ourselves without a pause, stress can build up, leading to burnout. Burnout leaves us feeling drained and unmotivated. By taking regular breaks, we manage stress better and keep our mood steady, making it easier to stay productive throughout the day.

Taking breaks isn't just good for our minds—it's good for our bodies too. Sitting for long periods can cause discomfort and health issues over time. A quick stretch or a short walk during a break can help relieve tension and improve our posture. This way, short breaks not only refresh our minds but also help us stay physically healthy.

In the end, taking short breaks is a simple habit that can make a big difference in how we feel and perform each day. It helps us stay sharp, manage stress, and take care of our bodies. So, next time you feel overwhelmed, remember that a little break can go a long way.''',
      image: 'assets/images/article2.jpg',
    ),
    Article(
      title: 'The impact of breaks',
      description: 'Discussing how stepping away from work for short periods can prevent physical ailments and promote better health.',
      content: '''Taking breaks throughout the workday isn’t just a luxury—it’s a necessity for staying healthy. When we step away from our tasks, even for a few minutes, it gives our bodies and minds a chance to recover. This simple act can help prevent physical problems that come from sitting too long or staying in one position. Regular breaks can make a big difference in how we feel at the end of the day.

Sitting for hours on end can lead to stiffness, muscle pain, and other physical issues. Our bodies aren’t meant to stay still for that long. When we take breaks to stand up, stretch, or move around, we reduce the strain on our muscles and joints. These small movements help keep our blood flowing and prevent the aches and pains that can come from sitting too much.

Breaks are also good for our overall health. Staying in one place for too long can increase the risk of more serious conditions like heart disease or back problems. But by taking a few minutes to move around or change positions, we can lower these risks. These small actions, done regularly, can help us maintain better health in the long run.

Mentally, breaks are just as important. Constant work without any downtime can lead to stress and mental fatigue. When we step away from our work, it gives our minds a chance to relax and reset. This not only helps us stay focused when we return, but it also reduces the stress that can build up over time.

In short, breaks are a simple and effective way to take care of ourselves during the workday. They help prevent physical discomfort and health problems, while also giving our minds the rest they need. By making breaks a regular part of our routine, we can stay healthier and feel better, both physically and mentally.''',
      image: 'assets/images/article3.jpg',
    ),
    Article(
      title: 'Break practices',
      description: 'A comparison of how different cultures approach breaks and the effects on work-life balance and productivity.',
      content: '''Different cultures have their own ways of handling breaks during the workday, and these practices can have a big impact on both work-life balance and productivity. In some cultures, taking breaks is seen as a vital part of staying productive, while in others, there’s more pressure to keep working without stopping. Understanding these differences can help us see the value of breaks and how they contribute to a healthier, more balanced work life.

For example, in countries like Spain and Italy, the idea of a "siesta" or long lunch break is common. Workers take time in the middle of the day to rest, eat, and recharge. This practice isn’t just about relaxing; it’s also about coming back to work with more energy and focus. People in these cultures often find that they are more productive in the afternoons after taking a proper break.

On the other hand, in some countries like the United States and Japan, the work culture is often more intense, with shorter breaks or sometimes none at all. The focus is more on staying at your desk and pushing through the workday. While this might seem like it would lead to more productivity, it can actually cause burnout and lower overall work quality. Without regular breaks, workers can become exhausted and less effective over time.

Interestingly, research shows that taking regular breaks can actually improve productivity, regardless of the culture. When workers are allowed to step away and relax, even for a short time, they return to their tasks with better concentration and creativity. This leads to higher-quality work and can even make the workday feel shorter and less stressful.

In conclusion, the way different cultures approach breaks highlights the importance of balancing work with rest. Whether it's a long lunch break or just a few minutes to step away from the desk, taking time to recharge is key to staying productive and maintaining a healthy work-life balance. By adopting some of these break practices, workers everywhere can benefit from better focus, less stress, and a more enjoyable workday.''',
      image: 'assets/images/article4.jpg',
    ),
  ];

  void _onItemTapped(int index) {
    handleBottomNavigationTap(context, index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Articles',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewArticleScreen(article: article),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        article.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              article.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
