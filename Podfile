workspace 'Easify'
platform :ios, '13.0'

# mark defs
def common_pods
	pod 'SpotifyLogin'
	use_frameworks!
end

def network_pods
    pod 'Alamofire'
    use_frameworks!
end

def core_pods
	project 'Modules/EasifyCore/EasifyCore.project'
    common_pods
end

def ui_pods
	project 'Modules/EasifyUI/EasifyUI.project'
    common_pods
end

def app_pods
	project 'Application/Easify.project'
    common_pods
end

# mark targets
target 'EasifyCore' do
    core_pods
end

target 'EasifyCoreTests' do
    core_pods
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