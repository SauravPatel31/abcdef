import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        width: 250,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and countdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suit alteration",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[800],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "3 days left",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "⏳ 4:21:20",
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1.2),
            Row(
              children: [
                Icon(Icons.lock, color: Colors.blue),
                SizedBox(width: 4),
                Text(
                  "for user 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              "description",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                onPressed: () {},
                child: Text("View Details", style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for Ticket Shape
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 10;
    Path path = Path();

    path.lineTo(size.width * 0.8, 0);
    path.arcToPoint(Offset(size.width, notchRadius),
        radius: Radius.circular(notchRadius), clockwise: false);
    path.lineTo(size.width, size.height - notchRadius);
    path.arcToPoint(Offset(size.width * 0.8, size.height),
        radius: Radius.circular(notchRadius), clockwise: false);
    path.lineTo(notchRadius, size.height);
    path.arcToPoint(Offset(0, size.height - notchRadius),
        radius: Radius.circular(notchRadius), clockwise: false);
    path.lineTo(0, notchRadius);
    path.arcToPoint(Offset(notchRadius, 0),
        radius: Radius.circular(notchRadius), clockwise: false);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
