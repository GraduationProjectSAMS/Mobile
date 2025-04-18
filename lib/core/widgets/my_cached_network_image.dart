import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

// class MyCachedNetworkImage extends StatefulWidget {
//   final String imageUrl;
//
//   final BoxFit? fit;
//
//   final BorderRadius? borderRadius;
//
//   const MyCachedNetworkImage({
//     super.key,
//     required this.imageUrl,
//     this.fit,
//     this.borderRadius,
//     this.width,
//     this.height,
//     this.loadingIndicatorColor,
//     this.errorBuilderWidget,
//   });
//
//   final double? width;
//   final double? height;
//   final Color? loadingIndicatorColor;
//   final Widget Function(BuildContext, Object, StackTrace?)? errorBuilderWidget;
//
//   static Widget errorBuilder(
//       BuildContext? context, Object? exception, StackTrace? stackTrace) {
//     return Center(
//       child: Icon(
//         Icons.image_not_supported_outlined,
//         color: Colors.grey[300],
//         size: 25.sp,
//       ),
//     );
//   }
//
//   @override
//   State<MyCachedNetworkImage> createState() => _MyCachedNetworkImageState();
// }
//
// class _MyCachedNetworkImageState extends State<MyCachedNetworkImage>  with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//
//     );
//     _controller.forward();
//
//   }
//   @override
//   dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget loadingBuilder(
//       BuildContext? context, Widget? child, ImageChunkEvent? loadingProgress) {
//     if (loadingProgress == null) return child!;
//     final progressValue =loadingProgress.cumulativeBytesLoaded /
//         (loadingProgress.expectedTotalBytes??0);
//     if(progressValue==1) _controller.forward();
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: CircularProgressIndicator(
//           value: progressValue,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: ClipRRect(
//         borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
//         child: Image(
//           height: widget.height,
//           fit: widget.fit ?? BoxFit.cover,
//           width: widget.width ?? double.infinity,
//           errorBuilder:widget.errorBuilderWidget?? MyCachedNetworkImage.errorBuilder,
//           loadingBuilder: loadingBuilder,
//           image: CachedNetworkImageProvider(widget.imageUrl),
//         ),
//       ),
//     );
//   }
// }
class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      this.fit,
      this.borderRadius,
      this.width,
      this.isOval = false,
      this.height});

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool isOval;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      );
    }
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      width: width ?? double.infinity,
      height: height,
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey[300],
          size: 25.sp,
        ),
      ),
      imageBuilder: (context, imageProvider) {
        if (isOval) {
          return ClipOval(child: buildImageDesign(imageProvider));
        }
        return buildImageDesign(imageProvider);
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        if (downloadProgress.progress == null) return SizedBox.shrink();
        return Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        );
      },
      imageUrl: imageUrl,
    );
  }

  Container buildImageDesign(ImageProvider<Object> imageProvider) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
