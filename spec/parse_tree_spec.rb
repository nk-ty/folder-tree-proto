require_relative '../parse_tree'

RSpec.describe ParseTree do
  let(:folders) do
    {
      "data": {
        "site_tree": {
          "folders": [
            {
              "id": "0",
              "name": "ROOT",
              "parent_id": nil
            },
            {
              "id": "1",
              "name": "Folder 1",
              "parent_id": "0"
            },
            {
              "id": "2",
              "name": "Folder 2",
              "parent_id": "0"
            },
            {
              "id": "3",
              "name": "Folder 1_1",
              "parent_id": "1"
            },
            {
              "id": "4",
              "name": "Folder 1_1_1",
              "parent_id": "3"
            },
            {
              "id": "5",
              "name": "Folder 2_1",
              "parent_id": "2"
            },
          ]
        }
      }
    }
  end

  let(:sites) do
    [
      {name: "site 1", parent_id: 4},
      {name: "site 2", parent_id: 5}
    ]
  end

  let(:folder_site) do
    [
      ["Folder 1","Folder 1_1","Folder 1_1_1","site 1"],
      ["Folder 2","Folder 2_1","site 2"]
    ]
  end

  it 'parse' do
    expect(subject.match(folders, sites)).to eq(folder_site)
  end
end