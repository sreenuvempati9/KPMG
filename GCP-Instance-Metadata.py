import googleapiclient.discovery

compute = googleapiclient.discovery.build('compute', 'v1')

project= "YOUR_PROJECT_ID"
zone= "A_ZONE"
instance_name = "INSTANCE_NAME"

instance_data = compute.instances().get(project=project, zone=zone, instance=instance_name).execute()

metadata_items = instance_data["metadata"]["items"]

body = {
    "fingerprint": instance_data["metadata"]["fingerprint"],
    "items": list(filter(lambda i: i['key'] != "KEY_TO_DELETE", metadata_items))
}