import 'package:flutter/material.dart';
import 'package:flutter_remote_config/controller/home_controller.dart';
import 'package:flutter_remote_config/remote/remote_constants.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase remote config')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  controller.remoteConfig.getString(RemoteConstants.image),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'App Name English: ${controller.remoteConfig.getString(RemoteConstants.appName('en'))}',
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'App Name Hindi: ${controller.remoteConfig.getString(RemoteConstants.appName('in'))}',
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'App Version: ${controller.remoteConfig.getString(RemoteConstants.appVersion)}',
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'Title: ${controller.remoteConfig.getString(RemoteConstants.titleText)}',
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'Body: ${controller.remoteConfig.getString(RemoteConstants.bodyText)}',
              ),
              const SizedBox(height: 20),
              _buildTextView(
                context,
                'Contact Email (Default): ${controller.remoteConfig.getString(RemoteConstants.contactEmail)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTextView(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
