workspace 'Easify'
platform :ios, '13.0'

# mark defs
def network_pods
    pod 'Alamofire'
    pod 'SpotifyLogin'
    use_frameworks!
end

def core_pods
	project 'Modules/EasifyCore/EasifyCore.project'
    pod 'SpotifyLogin'
end

def ui_pods
	project 'Modules/EasifyUI/EasifyUI.project'
    pod 'SpotifyLogin'
    use_frameworks!
end

def app_pods
	project 'Application/Easify.project'
    pod 'SpotifyLogin'
end

# mark targets
target 'EasifyCore' do
    core_pods
    network_pods
end

target 'EasifyCoreTests' do
    core_pods
    network_pods
end

target 'EasifyUI' do
    ui_pods
end

target 'EasifyUITests' do
    ui_pods
end

target 'Easify' do
    app_pods
end

target 'EasifyTests' do
    app_pods
end

target 'EasifyNetwork' do
    project 'Modules/EasifyNetwork/EasifyNetwork.project'
    network_pods
end

target 'EasifyNetworkTests' do
    project 'Modules/EasifyNetwork/EasifyNetwork.project'
    network_pods
end