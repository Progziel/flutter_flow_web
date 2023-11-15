import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnalyticsContainer extends StatefulWidget {
  final String analyticsType;
  final String analyticsValue;
  final String analyticsPercentage;
  final IconData icon;

  const CustomAnalyticsContainer({
    Key? key,
    required this.analyticsType,
    required this.analyticsValue,
    required this.analyticsPercentage,
    required this.icon,
  }) : super(key: key);

  @override
  _CustomAnalyticsContainerState createState() =>
      _CustomAnalyticsContainerState();
}

class _CustomAnalyticsContainerState extends State<CustomAnalyticsContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        child: SizedBox(
          width: 300,
          height: 150,
          child: Card(
            // shadowColor: AppAssets.backgroundColor,
            elevation: isHovered ? 0 : 5.0,
            color: isHovered ? Colors.orange.shade200 : null,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: widget.analyticsType,
                        fSize: 20.0,
                        fWeight: FontWeight.w700,
                      ),
                      const Icon(Icons.query_stats_outlined)
                    ],
                  ),
                  CustomTextWidget(
                    text: widget.analyticsValue,
                    fSize: 30.0,
                    fWeight: FontWeight.w500,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.analyticsPercentage,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Icon(
                              widget.icon,
                              size: 15,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' from last week',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
