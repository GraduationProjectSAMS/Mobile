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
  const MyCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.isOval = false,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool isOval;

  @override
  Widget build(BuildContext context) {
    final isEmptyImage = imageUrl.isEmpty;

    if (isEmptyImage) {
      return _buildPlaceholder();
    }

    return CachedNetworkImage(
      memCacheWidth: 300,
      // Resize to reasonable size
      memCacheHeight: 200,
      maxWidthDiskCache: 600,
      // Limit disk cache size
      maxHeightDiskCache: 400,
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      height: height,
      useOldImageOnUrlChange: true,
      imageBuilder: (context, imageProvider) => _buildImage(imageProvider),
      errorWidget: (context, url, error) => _buildErrorIcon(),
      progressIndicatorBuilder: (context, url, progress) =>
          _buildProgressIndicator(progress.progress),
    );
  }

  Widget _buildPlaceholder() {
    final container = _buildContainer(color: Colors.grey[300]);
    return isOval ? ClipOval(child: container) : container;
  }

  Widget _buildImage(ImageProvider<Object> imageProvider) {
    final container = _buildContainer(
      imageProvider: imageProvider,
    );
    return isOval ? ClipOval(child: container) : container;
  }

  Widget _buildContainer({ImageProvider<Object>? imageProvider, Color? color}) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        image: imageProvider != null
            ? DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover)
            : null,
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.grey[300],
        size: 25.sp,
      ),
    );
  }

  Widget _buildProgressIndicator(double? progress) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 400)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        return Center(
          child: CircularProgressIndicator(value: progress),
        );
      },
    );
  }
}
