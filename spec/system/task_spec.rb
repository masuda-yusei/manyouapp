require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
      visit new_task_path
      fill_in 'task[title]', with: 'test_title'
      fill_in 'task[content]', with: 'test_content'
      click_button 'Create Task'
      expect(page).to have_content 'test_title'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task_list = all('.task_row')
        expect(page).to have_content 'test_title'
        expect(page).to have_content 'test_title2'
      end
    end

    context '終了期限でソートするを押した場合' do
      it '終了期限の降順に並び替えられたタスク一覧が表示される'do
        visit tasks_path
        click_on '終了期限でソートする'
        task_list = all('.task_row')
        expect(task_list[0]).to have_content '2021-11-21'
        expect(task_list[1]).to have_content '2021-11-23'
      end
    end
  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit task_path(task.id)
        expect(page).to have_content 'test_title'
       end
     end
  end

  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in "Title", with: 'test_title'
        click_button 'Search'
        expect(page).to have_content 'test_title'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select "完了", from: 'Status'
        click_button 'Search'
        expect(page).to have_content '完了'
      end
    end

    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in "Title", with: 'test_title'
        select "完了", from: 'Status'
        click_button 'Search'
        expect(page).to have_content 'test_title'
        expect(page).to have_content '完了'
      end
    end

    context '優先順位でソートするをクリックした場合場合' do
      it '優先順位が高い順に並んでいる' do
        visit tasks_path
        click_on '優先順位が高い順にソートする'
        task_list = all('.task_row')
        expect(task_list[0]).to have_content '高'
        expect(task_list[1]).to have_content '中'
      end
    end
  end
end