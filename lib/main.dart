import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aishwarya Suvarna Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w800),
          headlineSmall: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class MyApp extends PortfolioApp {
  const MyApp({super.key});
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= 900;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 48 : 18,
            vertical: 24,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
                  const SizedBox(height: 24),
                  if (isWide)
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: MainColumn()),
                        SizedBox(width: 20),
                        Expanded(flex: 2, child: SideColumn()),
                      ],
                    )
                  else ...[
                    const MainColumn(),
                    const SizedBox(height: 16),
                    const SideColumn(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 700;

    final intro = Column(
      crossAxisAlignment: isCompact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Aishwarya Subhash Suvarna',
          textAlign: isCompact ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: const Color(0xFF111827),
            fontSize: isCompact ? 30 : 42,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Jr. Technical Consultant | Flutter, NetSuite, Angular, React',
          textAlign: isCompact ? TextAlign.center : TextAlign.start,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: const Color(0xFF4B5563)),
        ),
        const SizedBox(height: 18),
        Wrap(
          alignment: isCompact ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: const [
            ContactChip(icon: Icons.phone, label: '+91 9930391895'),
            ContactChip(
              icon: Icons.email,
              label: 'aishwaryasuvarna16@gmail.com',
            ),
            ContactChip(icon: Icons.code, label: 'github.com/Aish12s'),
            ContactChip(icon: Icons.emoji_events, label: 'LeetCode: aishs12'),
            ContactChip(icon: Icons.workspace_premium, label: 'HackerRank'),
          ],
        ),
      ],
    );

    final avatar = Container(
      width: 132,
      height: 132,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFBFDBFE)),
      ),
      child: const Icon(Icons.person, size: 72, color: Color(0xFF2563EB)),
    );

    return SectionCard(
      padding: const EdgeInsets.all(24),
      child: isCompact
          ? Column(children: [avatar, const SizedBox(height: 18), intro])
          : Row(
              children: [
                Expanded(child: intro),
                const SizedBox(width: 24),
                avatar,
              ],
            ),
    );
  }
}

class MainColumn extends StatelessWidget {
  const MainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResumeSection(
          title: 'Work Experience',
          children: [
            TimelineItem(
              title: 'Jr. Technical Consultant',
              subtitle: 'Ventus Infotech Pvt. Ltd. (Softype Inc.)',
              trailing: 'Nov 2023 - Aug 2025',
              bullets: [
                'Customized NetSuite using SuiteScript 2.0, including Client Scripts, User Event Scripts, Suitelets, and Map/Reduce scripts.',
                'Designed advanced PDF/HTML templates for invoices, purchase orders, and receipts with structured tax breakdowns.',
                'Built workflows and field-level scripts to automate record updates, validations, and business processes.',
                'Integrated NetSuite with third-party systems using RESTful APIs for real-time synchronization.',
                'Implemented a Flutter mobile app that connects to NetSuite through secure POST requests.',
                'Optimized legacy scripts and Suitelets for faster load times and improved maintainability.',
              ],
            ),
            TimelineItem(
              title: 'SDE Intern',
              subtitle: 'CRISIL Ltd.',
              trailing: 'Jan 2023 - Jul 2023',
              bullets: [
                'Registered and deployed reports in the frontend BI platform for UAT.',
                'Streamlined data analysis procedures, reducing processing time by 20%.',
                'Developed Angular screens from wireframes with drill-down data visualization flows.',
                'Created report tables with filters, validation, and clear visualization techniques.',
                'Identified and resolved complex frontend issues in the UAT platform.',
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        ResumeSection(
          title: 'Projects',
          children: [
            TimelineItem(
              title: 'Seeker - Search Engine',
              subtitle: 'Python, Flask, ReactJS, HTML, CSS',
              trailing: 'Sep 2022 - Dec 2022',
              bullets: [
                'Developed a web scraping strategy to collect structured website data for easy search and retrieval.',
                'Led a team of 3 members from planning through implementation.',
                'GitHub: github.com/Aish12s/retrival',
              ],
            ),
            TimelineItem(
              title: 'APT - Your Personal Trainer',
              subtitle: 'Dart, Android Studio, Machine Learning',
              trailing: 'Jun 2022 - Aug 2022',
              bullets: [
                'Built an app using single-person pose estimation to assess exercise effectiveness.',
                'Collaborated in a team of 3 to design, develop, and test the mobile experience.',
                'GitHub: github.com/Aish12s/Apt',
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SideColumn extends StatelessWidget {
  const SideColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResumeSection(
          title: 'Education',
          children: [
            InfoBlock(
              title: 'SIES College of Management Studies',
              detail: 'M.C.A. - Computer Applications\nCGPA: 7.75/10.00',
              meta: '2021 - 2023 | Navi Mumbai',
            ),
            InfoBlock(
              title: 'Vidyalankar School of Information Technology',
              detail: 'B.Sc. - Information Technology\nCGPA: 7.43/10.00',
              meta: '2018 - 2021 | Mumbai',
            ),
          ],
        ),
        SizedBox(height: 16),
        ResumeSection(
          title: 'Technical Skills',
          children: [
            SkillGroup(
              title: 'Programming',
              skills: [
                'Python',
                'JavaScript',
                'Node.js',
                'Java',
                'Dart',
                'HTML',
                'CSS',
                'Basic C#',
              ],
            ),
            SkillGroup(
              title: 'Frameworks',
              skills: [
                'Angular',
                'React',
                'Flutter',
                'Spring Boot',
                'Basic ASP.NET',
              ],
            ),
            SkillGroup(
              title: 'Databases',
              skills: [
                'Microsoft SQL Server',
                'MySQL',
                'MongoDB',
                'SQL Queries',
                'Stored Procedures',
              ],
            ),
            SkillGroup(
              title: 'Tools',
              skills: [
                'Git',
                'Bitbucket',
                'NetSuite',
                'Pentaho',
                'RESTful APIs',
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        ResumeSection(
          title: 'Certifications',
          children: [
            InfoBlock(
              title: 'Foundations: Data, Data, Everywhere',
              detail: 'Google | Aggregate: 97.28 / 100',
              meta: '28 Sep 2021',
            ),
            InfoBlock(
              title: 'The Complete 2023 Web Development Bootcamp',
              detail: 'Udemy | HTML, CSS, JavaScript, Node.js, React, MongoDB',
              meta: '30 Aug 2023',
            ),
            InfoBlock(
              title: 'Introduction to Programming in Python',
              detail: 'Microsoft Technology Associate',
              meta: '20 Jan 2020',
            ),
            InfoBlock(
              title: 'NPTEL Online Certification on Cloud Computing',
              detail: 'Aggregate: 68% [Elite]',
              meta: 'Jul 2022 - Oct 2022',
            ),
          ],
        ),
        SizedBox(height: 16),
        ResumeSection(
          title: 'Extracurricular',
          children: [
            InfoBlock(
              title: 'Deepshika, A Trust for Cancer Care',
              detail: 'Participated in a Cancer Patients Support Walkathon',
              meta: '4 Feb 2023',
            ),
          ],
        ),
      ],
    );
  }
}

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: const Color(0xFF111827)),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.bullets,
  });

  final String title;
  final String subtitle;
  final String trailing;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 12,
            runSpacing: 4,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(
                trailing,
                style: const TextStyle(
                  color: Color(0xFF2563EB),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF4B5563),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...bullets.map((bullet) => BulletText(text: bullet)),
        ],
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  const InfoBlock({
    super.key,
    required this.title,
    required this.detail,
    required this.meta,
  });

  final String title;
  final String detail;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            detail,
            style: const TextStyle(color: Color(0xFF4B5563), height: 1.35),
          ),
          const SizedBox(height: 4),
          Text(
            meta,
            style: const TextStyle(
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillGroup extends StatelessWidget {
  const SkillGroup({super.key, required this.title, required this.skills});

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  const BulletText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(Icons.circle, size: 6, color: Color(0xFF2563EB)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF374151), height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactChip extends StatelessWidget {
  const ContactChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF2563EB)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFBFDBFE)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1D4ED8),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F111827),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
