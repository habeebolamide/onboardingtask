import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Drop this widget anywhere (e.g. as your home:) to preview.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF9E9EA), Color(0xFFEFE5F7)],
          ),
        ),
        child: Stack(
          children: [
            // Subtle radial lights for depth
            const _CornerGlow(top: -140, left: -120, color: Color(0xFFFFD7E1), size: 320),
            const _CornerGlow(bottom: -120, right: -80, color: Color(0xFFEDD9FF), size: 300),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _page,
                      children: const [
                        _SubscriptionsPage(),
                        _ToolkitsPage(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SmoothPageIndicator(
                    controller: _page,
                    count: 2,
                    effect: const ExpandingDotsEffect(
                      radius: 6,
                      spacing: 8,
                      dotHeight: 6,
                      dotWidth: 6,
                      expansionFactor: 3,
                      dotColor: Color(0x3D000000),
                      activeDotColor: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const _PrimaryCta(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// PAGE 1 — Subscriptions list with glass cards & pills
class _SubscriptionsPage extends StatelessWidget {
  const _SubscriptionsPage();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    final isSmall = media.height < 750;

    final items = const [
      _SubItem('Framer', '\$12', 'Billed in 4 days', active: true),
      _SubItem('Figma', '\$12', 'Billed in 9 days'),
      _SubItem('Notion', '\$12', 'Billed in 16 days'),
      _SubItem('ChatGPT', '\$12', 'Billed in 24 days'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          ...List.generate(items.length, (i) {
            final it = items[i];
            return Padding(
              padding: EdgeInsets.only(bottom: i == items.length - 1 ? 18 : 12),
              child: _GlassCard(
                active: it.active,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _BrandIcon(name: it.name, muted: !it.active),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            it.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: it.active ? const Color(0xFF171717) : const Color(0x99171717),
                            ),
                          ),
                          if (it.active) const SizedBox(height: 10),
                          if (it.active)
                            Row(
                              children: const [
                                _Pill(text: 'View', tint: _PillTint.purple),
                                SizedBox(width: 8),
                                _Pill(text: 'Remind', tint: _PillTint.neutral),
                                SizedBox(width: 8),
                                _Pill(text: 'Cancel', tint: _PillTint.peach),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          it.price,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: it.active ? Colors.black : const Color(0x99171717),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          it.caption,
                          style: TextStyle(
                            fontSize: 12,
                            color: it.active ? const Color(0x8A000000) : const Color(0x61000000),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
          const Spacer(),
          Text(
            'Keep track of every\nsubscription',
            style: TextStyle(
              fontSize: isSmall ? 22 : 26,
              height: 1.15,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1C1C1C),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Stay on top of what you pay for.',
            style: TextStyle(fontSize: 14, color: Color(0x8A000000)),
          ),
        ],
      ),
    );
  }
}

/// PAGE 2 — Tilted toolkit cards
class _ToolkitsPage extends StatelessWidget {
  const _ToolkitsPage();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    final isSmall = media.height < 750;

    final toolkits = const [
      (
        title: 'Designers Toolkit',
        subtitle: '1,200 creatives trust this stack',
        angle: -0.02
      ),
      (
        title: 'Indie Hacker’s Essentials',
        subtitle: 'Curated by Sam Ortega  building profitable products solo',
        angle: 0.015
      ),
      (
        title: 'Remote Team Starter Pack',
        subtitle: 'Curated by Kendra Holt helping distributed teams thrive',
        angle: -0.012
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          ...toolkits.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Transform.rotate(
                  angle: t.angle,
                  child: _GlassCard(
                    active: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            _BrandIcon(name: 'Figma'),
                            SizedBox(width: 8),
                            _BrandIcon(name: 'Framer'),
                            SizedBox(width: 8),
                            _BrandIcon(name: 'Canva'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          t.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF171717),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          t.subtitle,
                          style: const TextStyle(fontSize: 12, color: Color(0x8A000000)),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const Spacer(),
          Text(
            'Work like the\nbest',
            style: TextStyle(
              fontSize: isSmall ? 24 : 28,
              height: 1.1,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1C1C1C),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Discover proven tools from the people who master their craft',
            style: TextStyle(fontSize: 14, color: Color(0x8A000000)),
          ),
        ],
      ),
    );
  }
}

// ------------------------- atoms -------------------------
class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child, this.active = true});
  final Widget child;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          // background blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: active
                    ? [
                        const Color(0xFFFFFFFF).withOpacity(0.75),
                        const Color(0xFFF6F0FF).withOpacity(0.70),
                      ]
                    : [
                        const Color(0xFFFFFFFF).withOpacity(0.45),
                        const Color(0xFFF1F1F1).withOpacity(0.35),
                      ],
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: active ? const Color(0x66FFFFFF) : const Color(0x4DFFFFFF),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _BrandIcon extends StatelessWidget {
  const _BrandIcon({required this.name, this.muted = false});
  final String name;
  final bool muted;

  Color _bg() {
    switch (name.toLowerCase()) {
      case 'framer':
        return const Color(0xFF111111);
      case 'figma':
        return const Color(0xFF6334EE);
      case 'notion':
        return const Color(0xFF111111);
      case 'chatgpt':
        return const Color(0xFF0C7A6B);
      case 'slack':
        return const Color(0xFF5A3E99);
      case 'miro':
        return const Color(0xFF1E88E5);
      case 'canva':
        return const Color(0xFF2BB2A8);
      default:
        return const Color(0xFF6666CC);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _bg().withOpacity(muted ? 0.25 : 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name.characters.first.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: name.toLowerCase() == 'figma' || name.toLowerCase() == 'canva'
              ? Colors.white
              : Colors.white,
        ),
      ),
    );
  }
}

enum _PillTint { purple, neutral, peach }

class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.tint});
  final String text;
  final _PillTint tint;

  @override
  Widget build(BuildContext context) {
    List<Color> colors;
    Color label;

    switch (tint) {
      case _PillTint.purple:
        colors = const [Color(0xFFEFE6FF), Color(0xFFDCC9FF)];
        label = const Color(0xFF6A42E9);
        break;
      case _PillTint.neutral:
        colors = const [Color(0xFFF3F3F4), Color(0xFFE9E9ED)];
        label = const Color(0xFF444750);
        break;
      case _PillTint.peach:
        colors = const [Color(0xFFFFE4EA), Color(0xFFFFD4D6)];
        label = const Color(0xFFB6425A);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: label,
        ),
      ),
    );
  }
}

class _PrimaryCta extends StatelessWidget {
  const _PrimaryCta();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2C2C2C), Colors.black],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Stack(
            children: [
              // glossy highlight
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.35),
                        Colors.white.withOpacity(0.02),
                      ],
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Get started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CornerGlow extends StatelessWidget {
  const _CornerGlow({super.key, this.top, this.left, this.right, this.bottom, required this.color, this.size = 260});
  final double? top, left, right, bottom;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color.withOpacity(0.55), color.withOpacity(0.0)],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubItem {
  final String name;
  final String price;
  final String caption;
  final bool active;
  const _SubItem(this.name, this.price, this.caption, {this.active = false});
}
